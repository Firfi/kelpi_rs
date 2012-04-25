################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/http_client/http_client.cpp 

OBJS += \
./dlib/http_client/http_client.o 

CPP_DEPS += \
./dlib/http_client/http_client.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/http_client/%.o: ../dlib/http_client/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


