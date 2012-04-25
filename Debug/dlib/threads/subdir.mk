################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/threads/multithreaded_object_extension.cpp \
../dlib/threads/thread_pool_extension.cpp \
../dlib/threads/threaded_object_extension.cpp \
../dlib/threads/threads_kernel_1.cpp \
../dlib/threads/threads_kernel_2.cpp \
../dlib/threads/threads_kernel_shared.cpp 

OBJS += \
./dlib/threads/multithreaded_object_extension.o \
./dlib/threads/thread_pool_extension.o \
./dlib/threads/threaded_object_extension.o \
./dlib/threads/threads_kernel_1.o \
./dlib/threads/threads_kernel_2.o \
./dlib/threads/threads_kernel_shared.o 

CPP_DEPS += \
./dlib/threads/multithreaded_object_extension.d \
./dlib/threads/thread_pool_extension.d \
./dlib/threads/threaded_object_extension.d \
./dlib/threads/threads_kernel_1.d \
./dlib/threads/threads_kernel_2.d \
./dlib/threads/threads_kernel_shared.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/threads/%.o: ../dlib/threads/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


