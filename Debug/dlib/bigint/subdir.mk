################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/bigint/bigint_kernel_1.cpp \
../dlib/bigint/bigint_kernel_2.cpp 

OBJS += \
./dlib/bigint/bigint_kernel_1.o \
./dlib/bigint/bigint_kernel_2.o 

CPP_DEPS += \
./dlib/bigint/bigint_kernel_1.d \
./dlib/bigint/bigint_kernel_2.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/bigint/%.o: ../dlib/bigint/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


