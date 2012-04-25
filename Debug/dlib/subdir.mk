################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/all_console.cpp \
../dlib/all_gui.cpp \
../dlib/stack_trace.cpp 

OBJS += \
./dlib/all_console.o \
./dlib/all_gui.o \
./dlib/stack_trace.o 

CPP_DEPS += \
./dlib/all_console.d \
./dlib/all_gui.d \
./dlib/stack_trace.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/%.o: ../dlib/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


