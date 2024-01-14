################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.c \
../Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.c 

C_DEPS += \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.d \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.d 

OBJS += \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.o \
./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/NN/Source/NNSupportFunctions/%.o Drivers/CMSIS/NN/Source/NNSupportFunctions/%.su: ../Drivers/CMSIS/NN/Source/NNSupportFunctions/%.c Drivers/CMSIS/NN/Source/NNSupportFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/Core/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/PrivateInclude" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/flatbuffers/include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/gemmlowp" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/ruy" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Core/Inc/models" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions

clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions:
	-$(RM) ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_accumulate_q7_to_q15.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_add_q7.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_padded_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_depthwise_conv_nt_t_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_1x_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_core_4x_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mul_kernel_s16.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mat_mult_nt_t_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q15.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_mult_q7.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s16.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nn_vec_mat_mult_t_svdf_s8.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_nntables.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_no_shift.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_no_shift.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_reordered_with_offset.su ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.d ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.o ./Drivers/CMSIS/NN/Source/NNSupportFunctions/arm_q7_to_q15_with_offset.su

.PHONY: clean-Drivers-2f-CMSIS-2f-NN-2f-Source-2f-NNSupportFunctions
