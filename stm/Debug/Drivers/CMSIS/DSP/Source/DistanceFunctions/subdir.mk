################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.c \
../Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.c 

C_DEPS += \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.d \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.d 

OBJS += \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.o \
./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.o 


# Each subdirectory must supply rules for building sources it contributes
Drivers/CMSIS/DSP/Source/DistanceFunctions/%.o Drivers/CMSIS/DSP/Source/DistanceFunctions/%.su: ../Drivers/CMSIS/DSP/Source/DistanceFunctions/%.c Drivers/CMSIS/DSP/Source/DistanceFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L475xx -DCMSIS_NN -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/Core/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/Include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/DSP/PrivateInclude" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Drivers/CMSIS/NN/Include" -I../Drivers/CMSIS/Include -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/flatbuffers/include" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/gemmlowp" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/tensorflow_lite/third_party/ruy" -I"/home/kai/Documents/university/polybox/Semester/HS23/MLonMCU/Exercise6/image_classification/Core/Inc/models" -O3 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-DistanceFunctions

clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-DistanceFunctions:
	-$(RM) ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_boolean_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_braycurtis_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_canberra_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_chebyshev_distance_f64.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cityblock_distance_f64.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_correlation_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_cosine_distance_f64.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_dice_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_euclidean_distance_f64.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_hamming_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jaccard_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_jensenshannon_distance_f32.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_kulsinski_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f16.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_minkowski_distance_f32.su
	-$(RM) ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_rogerstanimoto_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_russellrao_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalmichener_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_sokalsneath_distance.su ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.d ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.o ./Drivers/CMSIS/DSP/Source/DistanceFunctions/arm_yule_distance.su

.PHONY: clean-Drivers-2f-CMSIS-2f-DSP-2f-Source-2f-DistanceFunctions

