################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.cc \
../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.d \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o \
./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/%.o tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/%.su: ../tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/%.cc tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/Core/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/PrivateInclude" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/flatbuffers/include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/gemmlowp" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/ruy" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Core/Inc/models" -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn

clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn:
	-$(RM) ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/add.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/conv.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/depthwise_conv.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/fully_connected.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/mul.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/pooling.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/softmax.su ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.d ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.o ./tensorflow_lite/tensorflow/lite/micro/kernels/cmsis_nn/svdf.su

.PHONY: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro-2f-kernels-2f-cmsis_nn

