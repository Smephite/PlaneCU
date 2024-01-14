#include "app.h"
#include "usart.h"


#include "tensorflow/lite/micro/all_ops_resolver.h"
#include "tensorflow/lite/micro/micro_error_reporter.h"
#include "tensorflow/lite/micro/micro_interpreter.h"
#include "tensorflow/lite/micro/micro_allocator.h"
#include "tensorflow/lite/micro/system_setup.h"
#include "tensorflow/lite/schema/schema_generated.h"
#include "planeship.h"
#include "ship.h"
#include "plane.h"
#include "none.h"


#include <stdio.h>
#include <stdlib.h>


#include <CycleCounter.h>



tflite::ErrorReporter* error_reporter = nullptr;
const tflite::Model* nn = nullptr;
tflite::MicroInterpreter* interpreter = nullptr;
TfLiteTensor* nn_input = nullptr;
TfLiteTensor* nn_output = nullptr;
constexpr size_t kTensorArenaSize = 60*1024;
uint8_t tensor_arena[kTensorArenaSize];

void ConvertFromUint8(float* mO, unsigned char* mI, int numElements, float scalingFctr)
{
//	printf("We are trying to convert the data...\r\n");
    int ii;
    for (ii = 0; ii < numElements; ii++) {
        mO[ii] = (float)(mI[ii]) * scalingFctr;
    }
}


uint8_t invoke(const unsigned char* image, int length) {

	ResetTimer();
	StartTimer();

	TfLiteStatus tflite_status;
	TfLiteTensor* nn_input = interpreter->input(0);
	TfLiteTensor* nn_output = interpreter->output(0);


	ConvertFromUint8(nn_input->data.f, (unsigned char*)image, length, 1.0/255.0);

//	for(int i = 0; i < length; ++i) {
//		nn_input->data.uint8[i] = (uint8)image[i];
//	}


	tflite_status = interpreter->Invoke();
	StopTimer();

	if(tflite_status != kTfLiteOk){
		error_reporter->Report("Invoke failed");
	}

	// 80 MHz =>
	unsigned int c = getCycles();
	double ms = c / 80000;

	printf("Ran in %u ms with result code %u\r\n", (int)ms, tflite_status);

	bool* b = nn_output->data.b;
//	printf("%s %s %s\r\n", b[0] ? "true" : "false", b[1] ? "true" : "false", b[2] ? "true" : "false");

	// none: 0, plane: 1, ship: 2, error: 3
	return b[0] ? 0 : b[1] ? 1 : b[2] ? 2 : 3;

}


volatile static unsigned char INPUT[20*20*3] = {0};

int application()
{
	// Setup code
//	MicroPrintf("Hello there");
	TfLiteStatus tflite_status;
	tflite::InitializeTarget();
//	 Set up logging (modify tensorflow/lite/micro/debug_log.cc)
	static tflite::MicroErrorReporter micro_error_reporter;
	error_reporter = &micro_error_reporter;

	//   Map the model into a usable data structure
	nn = tflite::GetModel(PLANE_SHIP_CLASSIFIER);
	if (nn->version() != TFLITE_SCHEMA_VERSION)
	{
		error_reporter->Report("Model version does not match Schema\n");
	}

	static tflite::AllOpsResolver micro_op_resolver;

	static tflite::MicroAllocator *micro_allocator;
	micro_allocator = tflite::MicroAllocator::Create(tensor_arena, kTensorArenaSize, error_reporter);
	// Build an interpreter to run the model with.
	static tflite::MicroInterpreter static_interpreter(
			nn, micro_op_resolver, micro_allocator, error_reporter);
	interpreter = &static_interpreter;

	// Allocate memory from the tensor_arena for the model's tensors.
	tflite_status = interpreter->AllocateTensors();
	if (tflite_status != kTfLiteOk){
		error_reporter->Report("AllocateTensors() failed\n");
	}

//
//	printf("\r\nRunning with Test Data\r\n");
//
//	uint8_t p = invoke(PLANE_TEST_IMAGE, PLANE_TEST_IMAGE_len);
//	printf("Plane Test: %u\r\n", p);
//
//	uint8_t s = invoke(SHIP_TEST_IMAGE, SHIP_TEST_IMAGE_len);
//	printf("Ship Test: %u\r\n", s);
//
//	uint8_t n = invoke(NONE_TEST_IMAGE, NONE_TEST_IMAGE_len);
//	printf("None Test: %u\r\n", n);

	printf("Waiting for incoming UART...\r\n");
	HAL_Delay(200);

	volatile TfLiteTensor* nn_input = interpreter->input(0);
	volatile TfLiteTensor* nn_output = interpreter->output(0);

//	for(unsigned int i = 0; i < 20*20*3; ++i) {
//		nn_input->data.int8[i] = 0xff;
//	}

		uint8_t crnt = 0xFF;

		bool RETURN_IMAGE = false;


		while(HAL_UART_Receive(&huart1, &crnt, 1, HAL_MAX_DELAY) != HAL_OK);


		HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET);

		if (crnt == 0x11) {
			printf("Image return : ON\n\r");
			RETURN_IMAGE = true;
		} else {
			printf("Image return : OFF\n\r");
		}

		HAL_Delay(400);
		uint8_t zero = 0x00;
		HAL_UART_Transmit(&huart1, &zero, 1, HAL_MAX_DELAY);

		while(HAL_UART_GetState(&huart1) != HAL_UART_STATE_READY);

		uint8_t* write_to = (uint8_t*)INPUT;

		TfLiteType in_t = nn_input->type;

		if (in_t == kTfLiteUInt8) {
			write_to = nn_input->data.uint8;
		}

		while(1){
			HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_RESET);

			HAL_UART_Receive(&huart1, write_to, 20*20*3, HAL_MAX_DELAY);
			if(RETURN_IMAGE) {
			HAL_UART_Transmit(&huart1, write_to, 20*20*3, HAL_MAX_DELAY);
			}
//			HAL_Delay(500);

			if(in_t == kTfLiteFloat32) {
				ConvertFromUint8(nn_input->data.f, (unsigned char*)write_to, 20*20*3, 1.0/255.0);
			} else if (in_t != kTfLiteUInt8){
				printf("Error!");
				return 0;
			}

//			HAL_Delay(200);

			ResetTimer();
			StartTimer();

			tflite_status = interpreter->Invoke();

			StopTimer();
			HAL_GPIO_WritePin(LED2_GPIO_Port, LED2_Pin, GPIO_PIN_SET);

			if(tflite_status != kTfLiteOk){
				HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_SET);
				error_reporter->Report("Invoke failed");
			} else {
				HAL_GPIO_WritePin(LED1_GPIO_Port, LED1_Pin, GPIO_PIN_RESET);
			}

		//	printf("%s %s %s\r\n", b[0] ? "true" : "false", b[1] ? "true" : "false", b[2] ? "true" : "false");

			// none: 0, plane: 1, ship: 2, error: 3
//			const uint8_t z = b[0] ? 0 : b[1] ? 1 : b[2] ? 2 : 3;

			HAL_UART_Transmit(&huart1, (uint8_t*)nn_output->data.uint8, 3, HAL_MAX_DELAY);
			unsigned int c = getCycles();

			HAL_UART_Transmit(&huart1, (uint8_t*)&c, sizeof(unsigned int), HAL_MAX_DELAY);



		}
	}


void DebugLog(const char* s)
{
	HAL_UART_Transmit(&huart1, (uint8_t*)s, strlen(s), 100);
}
