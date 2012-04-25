################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/image_loader/jpeg_loader.cpp \
../dlib/image_loader/png_loader.cpp 

OBJS += \
./dlib/image_loader/jpeg_loader.o \
./dlib/image_loader/png_loader.o 

CPP_DEPS += \
./dlib/image_loader/jpeg_loader.d \
./dlib/image_loader/png_loader.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/image_loader/%.o: ../dlib/image_loader/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


