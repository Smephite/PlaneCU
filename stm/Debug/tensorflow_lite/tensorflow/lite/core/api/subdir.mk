################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/core/api/error_reporter.cc \
../tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.cc \
../tensorflow_lite/tensorflow/lite/core/api/op_resolver.cc \
../tensorflow_lite/tensorflow/lite/core/api/tensor_utils.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/core/api/error_reporter.d \
./tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.d \
./tensorflow_lite/tensorflow/lite/core/api/op_resolver.d \
./tensorflow_lite/tensorflow/lite/core/api/tensor_utils.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/core/api/error_reporter.o \
./tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.o \
./tensorflow_lite/tensorflow/lite/core/api/op_resolver.o \
./tensorflow_lite/tensorflow/lite/core/api/tensor_utils.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/core/api/%.o tensorflow_lite/tensorflow/lite/core/api/%.su: ../tensorflow_lite/tensorflow/lite/core/api/%.cc tensorflow_lite/tensorflow/lite/core/api/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/Core/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/PrivateInclude" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/flatbuffers/include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/gemmlowp" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/ruy" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Core/Inc/models" -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-core-2f-api

clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-core-2f-api:
	-$(RM) ./tensorflow_lite/tensorflow/lite/core/api/error_reporter.d ./tensorflow_lite/tensorflow/lite/core/api/error_reporter.o ./tensorflow_lite/tensorflow/lite/core/api/error_reporter.su ./tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.d ./tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.o ./tensorflow_lite/tensorflow/lite/core/api/flatbuffer_conversions.su ./tensorflow_lite/tensorflow/lite/core/api/op_resolver.d ./tensorflow_lite/tensorflow/lite/core/api/op_resolver.o ./tensorflow_lite/tensorflow/lite/core/api/op_resolver.su ./tensorflow_lite/tensorflow/lite/core/api/tensor_utils.d ./tensorflow_lite/tensorflow/lite/core/api/tensor_utils.o ./tensorflow_lite/tensorflow/lite/core/api/tensor_utils.su

.PHONY: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-core-2f-api

