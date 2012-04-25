################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/logger/extra_logger_headers.cpp \
../dlib/logger/logger_config_file.cpp \
../dlib/logger/logger_kernel_1.cpp 

OBJS += \
./dlib/logger/extra_logger_headers.o \
./dlib/logger/logger_config_file.o \
./dlib/logger/logger_kernel_1.o 

CPP_DEPS += \
./dlib/logger/extra_logger_headers.d \
./dlib/logger/logger_config_file.d \
./dlib/logger/logger_kernel_1.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/logger/%.o: ../dlib/logger/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


