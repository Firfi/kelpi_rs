################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/test/gui/main.cpp 

OBJS += \
./dlib/test/gui/main.o 

CPP_DEPS += \
./dlib/test/gui/main.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/test/gui/%.o: ../dlib/test/gui/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


