#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include "mxc.h"
#include "cnn.h"
#include "sampledata.h"
#include "led.h"

#define WINDOW_SIZE 20
#define STRIDE 1

#define IMAGESIZE 20

#define SEND_IMAGE_BACK false
#define SEND_POST_IMAGE_BACK false



uint32_t result[((IMAGESIZE - WINDOW_SIZE + 1) / STRIDE) * sizeof(uint32_t)];

// 3-channel scene data input:
// HWC 20x20, channels 0 to 2
//static uint32_t scene_data[] = SAMPLE_INPUT_0;

// 3-channel 20x20 data input (1200 bytes total / 400 bytes per channel):
// HWC 20x20, channels 0 to 2
static uint32_t INPUT_PATCH[WINDOW_SIZE * WINDOW_SIZE] = {};
static unsigned char UART_IN[WINDOW_SIZE * WINDOW_SIZE * 3] = {};

// Function to extract a single 20x20 patch using a sliding window
void extractPatch(uint32_t *imageData, int imageWidth, int imageHeight, int patchIndex, uint32_t *patch)
{
    int index = 0;

    // Calculate the starting coordinates for the specified patch
    int y = (patchIndex / ((imageHeight - WINDOW_SIZE + 1) / STRIDE)) * STRIDE;
    int x = (patchIndex % ((imageWidth - WINDOW_SIZE + 1) / STRIDE)) * STRIDE;

    // Extract the 20x20 patch
    for (int f = 0; f < WINDOW_SIZE; f++)
    {
        for (int g = 0; g < WINDOW_SIZE; g++)
        {
            patch[index++] = imageData[(y + f) * imageWidth + x + g];
        }
    }
}

// uint8_t tranform_color_value(unsigned char in) {
//     uint8_t color_value = (uint8_t)in;

//     in = ((int)in - 128);
//     return in;
// }

static void utils_send_byte(mxc_uart_regs_t *uart, uint8_t value)
{
    while (MXC_UART_WriteCharacter(uart, value) == E_OVERFLOW) {}
}

static void utils_send_bytes(mxc_uart_regs_t *uart, uint8_t *ptr, int length)
{
    int i;

    for (i = 0; i < length; i++) {
        utils_send_byte(uart, ptr[i]);
    }
}

void load_input(void)
{   
    // This function loads the sample data input
    int len = 20 * 20 * 3;

    MXC_UART_Read(MXC_UART0, (uint8_t*)UART_IN, &len);
    MXC_Delay(MSEC(0.0001));
    
    
    if (SEND_IMAGE_BACK) {
        utils_send_bytes((mxc_uart_regs_t *)MXC_UART0, (uint8_t*)UART_IN, len);
        MXC_Delay(MSEC(100));
    }

    for (unsigned int i = 0; i < WINDOW_SIZE * WINDOW_SIZE * 3; i += 3) {
    
        INPUT_PATCH[i / 3] = (0x00000000 | (((uint8_t)UART_IN[i + 2]) << 16) | (((uint8_t)UART_IN[i + 1]) << 8) | ((uint8_t)UART_IN[i + 0])) ^ 0x00808080;
        //INPUT_PATCH[i / 3] = ((float)UART_IN[i + 0] / 255.0);
        //INPUT_PATCH[i / 3 + 1] = ((float)UART_IN[i + 1] / 255.0);
        //INPUT_PATCH[i / 3 + 2] = ((float)UART_IN[i + 2] / 255.0);
    }

    if (SEND_POST_IMAGE_BACK) {
        utils_send_bytes((mxc_uart_regs_t *)MXC_UART0, (uint8_t*)INPUT_PATCH, len/3*4);
        MXC_Delay(MSEC(1));
    }

    memcpy32((uint32_t *)0x50400000, INPUT_PATCH, 400);  //len/3
    //memcpy((uint32_t *)0x50400000, INPUT_PATCH, 400);
}

// Classification layer:
static int32_t ml_data[CNN_NUM_OUTPUTS];
static q15_t ml_softmax[CNN_NUM_OUTPUTS];

void softmax_layer(void)
{
    cnn_unload((uint32_t *)ml_data);
    softmax_q17p14_q15((const q31_t *)ml_data, CNN_NUM_OUTPUTS, ml_softmax);
}

void app()
{   
    
    // printf("\n*** app called ***\n");
    // uint32_t i;
    int digs, tens;

    // uint32_t imageWidth = sizeof(scene_data) / sizeof(uint32_t);
    // uint32_t imageHeight = 1; // Assuming a 1D array

    // Calculate the maximum number of patches
    int maxPatches = (IMAGESIZE - WINDOW_SIZE + 1) / STRIDE; //* (imageHeight - WINDOW_SIZE + 1);

    // Sliding Window over scene_data
    // uint32_t maxPatchespatchIndex = 0;

    // printf("Start Interference of Scene");
    // printf("Patches: %d", maxPatches);

    // Enable peripheral, enable CNN interrupt, turn on CNN clock
    // CNN clock: APB (50 MHz) div 1
    cnn_enable(MXC_S_GCR_PCLKDIV_CNNCLKSEL_PCLK, MXC_S_GCR_PCLKDIV_CNNCLKDIV_DIV1);

    // printf("\n*** CNN Inference Test planeshipnet ***\n");

    cnn_init();         // Bring state machine into consistent state
    cnn_load_weights(); // Load kernels
    cnn_load_bias();
    cnn_configure(); // Configure state machine

    uint8_t out_result = 0;

    // for (int i = 0; i < maxPatches; i++) {  //maxPatches

    // extractPatch(scene_data, IMAGESIZE, IMAGESIZE, i, input_patch);

    

    while (1)
    {
        load_input();

        cnn_start(); // Start CNN processing

        while (cnn_time == 0)
            MXC_LP_EnterSleepMode(); // Wait for CNN

        softmax_layer();

        // printf("\n*** Patch %u/%u result: ***\n\n", i + 1, maxPatches);

        // int maxi = 0;

        // int max_digs = 0;
        // int max_tens = 0;

        digs = 0;
        tens = 0;
        for (int k = 0; k < CNN_NUM_OUTPUTS; k++)
        {

            digs = (1000 * ml_softmax[k] + 0x4000) >> 15;

            tens = digs % 10;

            digs = digs / 10;
            // printf("3");
            //  printf("[%7d] -> Class %d: %d.%d%%\n", ml_data[k], k, digs, tens);
            //  //printf("2");
            //  if (digs > max_digs || (digs == max_digs && tens > max_tens)) {
            //      maxi = k;
            //  }

            uint8_t ranged = (uint8_t)((digs + tens / 10.0) / 100.0 * 255.0);

            int len = 1;

            MXC_UART_Write(MXC_UART0, &ranged, &len);
        }
        MXC_Delay(MSEC(0.0001));
    } // printf("patch done");

    // result[i] = maxi; //save result of classification
    //  out_result = maxi;

    // MXC_Delay(SEC(0.1));

    // break;
    // }

    cnn_disable(); // Shut down CNN clock, disable peripheral

    // MXC_UART_WriteCharacter(MXC_UART0, out_result);

    // //Print Result
    // printf("Finished");
    // for (int l = 0; l < 1; l++) {
    //     printf("Patch [%u]: %u", l + 1, result[l]);
    // }
}