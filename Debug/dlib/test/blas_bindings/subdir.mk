################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/test/blas_bindings/blas_bindings_dot.cpp \
../dlib/test/blas_bindings/blas_bindings_gemm.cpp \
../dlib/test/blas_bindings/blas_bindings_gemv.cpp \
../dlib/test/blas_bindings/blas_bindings_ger.cpp \
../dlib/test/blas_bindings/vector.cpp 

OBJS += \
./dlib/test/blas_bindings/blas_bindings_dot.o \
./dlib/test/blas_bindings/blas_bindings_gemm.o \
./dlib/test/blas_bindings/blas_bindings_gemv.o \
./dlib/test/blas_bindings/blas_bindings_ger.o \
./dlib/test/blas_bindings/vector.o 

CPP_DEPS += \
./dlib/test/blas_bindings/blas_bindings_dot.d \
./dlib/test/blas_bindings/blas_bindings_gemm.d \
./dlib/test/blas_bindings/blas_bindings_gemv.d \
./dlib/test/blas_bindings/blas_bindings_ger.d \
./dlib/test/blas_bindings/vector.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/test/blas_bindings/%.o: ../dlib/test/blas_bindings/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


