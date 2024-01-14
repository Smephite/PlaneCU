################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CC_SRCS += \
../tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.cc \
../tensorflow_lite/tensorflow/lite/micro/fake_micro_context.cc \
../tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.cc \
../tensorflow_lite/tensorflow/lite/micro/memory_helpers.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_context.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_graph.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_interpreter.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_profiler.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_string.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_time.cc \
../tensorflow_lite/tensorflow/lite/micro/micro_utils.cc \
../tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.cc \
../tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.cc \
../tensorflow_lite/tensorflow/lite/micro/system_setup.cc \
../tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.cc \
../tensorflow_lite/tensorflow/lite/micro/test_helpers.cc 

CC_DEPS += \
./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.d \
./tensorflow_lite/tensorflow/lite/micro/fake_micro_context.d \
./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.d \
./tensorflow_lite/tensorflow/lite/micro/memory_helpers.d \
./tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.d \
./tensorflow_lite/tensorflow/lite/micro/micro_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/micro_context.d \
./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.d \
./tensorflow_lite/tensorflow/lite/micro/micro_graph.d \
./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.d \
./tensorflow_lite/tensorflow/lite/micro/micro_profiler.d \
./tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.d \
./tensorflow_lite/tensorflow/lite/micro/micro_string.d \
./tensorflow_lite/tensorflow/lite/micro/micro_time.d \
./tensorflow_lite/tensorflow/lite/micro/micro_utils.d \
./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.d \
./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.d \
./tensorflow_lite/tensorflow/lite/micro/system_setup.d \
./tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.d \
./tensorflow_lite/tensorflow/lite/micro/test_helpers.d 

OBJS += \
./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.o \
./tensorflow_lite/tensorflow/lite/micro/fake_micro_context.o \
./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.o \
./tensorflow_lite/tensorflow/lite/micro/memory_helpers.o \
./tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.o \
./tensorflow_lite/tensorflow/lite/micro/micro_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/micro_context.o \
./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.o \
./tensorflow_lite/tensorflow/lite/micro/micro_graph.o \
./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.o \
./tensorflow_lite/tensorflow/lite/micro/micro_profiler.o \
./tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.o \
./tensorflow_lite/tensorflow/lite/micro/micro_string.o \
./tensorflow_lite/tensorflow/lite/micro/micro_time.o \
./tensorflow_lite/tensorflow/lite/micro/micro_utils.o \
./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.o \
./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.o \
./tensorflow_lite/tensorflow/lite/micro/system_setup.o \
./tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.o \
./tensorflow_lite/tensorflow/lite/micro/test_helpers.o 


# Each subdirectory must supply rules for building sources it contributes
tensorflow_lite/tensorflow/lite/micro/%.o tensorflow_lite/tensorflow/lite/micro/%.su: ../tensorflow_lite/tensorflow/lite/micro/%.cc tensorflow_lite/tensorflow/lite/micro/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m4 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/Core/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/PrivateInclude" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/flatbuffers/include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/gemmlowp" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/ruy" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Core/Inc/models" -O3 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro

clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro:
	-$(RM) ./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.d ./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.o ./tensorflow_lite/tensorflow/lite/micro/all_ops_resolver.su ./tensorflow_lite/tensorflow/lite/micro/fake_micro_context.d ./tensorflow_lite/tensorflow/lite/micro/fake_micro_context.o ./tensorflow_lite/tensorflow/lite/micro/fake_micro_context.su ./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.d ./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.o ./tensorflow_lite/tensorflow/lite/micro/flatbuffer_utils.su ./tensorflow_lite/tensorflow/lite/micro/memory_helpers.d ./tensorflow_lite/tensorflow/lite/micro/memory_helpers.o ./tensorflow_lite/tensorflow/lite/micro/memory_helpers.su ./tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.d ./tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.o ./tensorflow_lite/tensorflow/lite/micro/micro_allocation_info.su ./tensorflow_lite/tensorflow/lite/micro/micro_allocator.d ./tensorflow_lite/tensorflow/lite/micro/micro_allocator.o ./tensorflow_lite/tensorflow/lite/micro/micro_allocator.su ./tensorflow_lite/tensorflow/lite/micro/micro_context.d ./tensorflow_lite/tensorflow/lite/micro/micro_context.o ./tensorflow_lite/tensorflow/lite/micro/micro_context.su ./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.d ./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.o ./tensorflow_lite/tensorflow/lite/micro/micro_error_reporter.su ./tensorflow_lite/tensorflow/lite/micro/micro_graph.d ./tensorflow_lite/tensorflow/lite/micro/micro_graph.o ./tensorflow_lite/tensorflow/lite/micro/micro_graph.su ./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.d ./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.o ./tensorflow_lite/tensorflow/lite/micro/micro_interpreter.su ./tensorflow_lite/tensorflow/lite/micro/micro_profiler.d ./tensorflow_lite/tensorflow/lite/micro/micro_profiler.o ./tensorflow_lite/tensorflow/lite/micro/micro_profiler.su ./tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.d ./tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.o ./tensorflow_lite/tensorflow/lite/micro/micro_resource_variable.su ./tensorflow_lite/tensorflow/lite/micro/micro_string.d ./tensorflow_lite/tensorflow/lite/micro/micro_string.o ./tensorflow_lite/tensorflow/lite/micro/micro_string.su ./tensorflow_lite/tensorflow/lite/micro/micro_time.d ./tensorflow_lite/tensorflow/lite/micro/micro_time.o ./tensorflow_lite/tensorflow/lite/micro/micro_time.su ./tensorflow_lite/tensorflow/lite/micro/micro_utils.d ./tensorflow_lite/tensorflow/lite/micro/micro_utils.o ./tensorflow_lite/tensorflow/lite/micro/micro_utils.su ./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.d ./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.o ./tensorflow_lite/tensorflow/lite/micro/mock_micro_graph.su ./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.d ./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.o ./tensorflow_lite/tensorflow/lite/micro/recording_micro_allocator.su ./tensorflow_lite/tensorflow/lite/micro/system_setup.d ./tensorflow_lite/tensorflow/lite/micro/system_setup.o ./tensorflow_lite/tensorflow/lite/micro/system_setup.su ./tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.d ./tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.o ./tensorflow_lite/tensorflow/lite/micro/test_helper_custom_ops.su ./tensorflow_lite/tensorflow/lite/micro/test_helpers.d ./tensorflow_lite/tensorflow/lite/micro/test_helpers.o ./tensorflow_lite/tensorflow/lite/micro/test_helpers.su

.PHONY: clean-tensorflow_lite-2f-tensorflow-2f-lite-2f-micro

