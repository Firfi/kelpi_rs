################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/image_saver/save_png.cpp 

OBJS += \
./dlib/image_saver/save_png.o 

CPP_DEPS += \
./dlib/image_saver/save_png.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/image_saver/%.o: ../dlib/image_saver/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


