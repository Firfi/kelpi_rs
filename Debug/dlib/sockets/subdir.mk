################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/sockets/sockets_extensions.cpp \
../dlib/sockets/sockets_kernel_1.cpp \
../dlib/sockets/sockets_kernel_2.cpp 

OBJS += \
./dlib/sockets/sockets_extensions.o \
./dlib/sockets/sockets_kernel_1.o \
./dlib/sockets/sockets_kernel_2.o 

CPP_DEPS += \
./dlib/sockets/sockets_extensions.d \
./dlib/sockets/sockets_kernel_1.d \
./dlib/sockets/sockets_kernel_2.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/sockets/%.o: ../dlib/sockets/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


