################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/gui_core/gui_core_kernel_1.cpp \
../dlib/gui_core/gui_core_kernel_2.cpp 

OBJS += \
./dlib/gui_core/gui_core_kernel_1.o \
./dlib/gui_core/gui_core_kernel_2.o 

CPP_DEPS += \
./dlib/gui_core/gui_core_kernel_1.d \
./dlib/gui_core/gui_core_kernel_2.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/gui_core/%.o: ../dlib/gui_core/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


