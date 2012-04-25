################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/tokenizer/tokenizer_kernel_1.cpp 

OBJS += \
./dlib/tokenizer/tokenizer_kernel_1.o 

CPP_DEPS += \
./dlib/tokenizer/tokenizer_kernel_1.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/tokenizer/%.o: ../dlib/tokenizer/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


