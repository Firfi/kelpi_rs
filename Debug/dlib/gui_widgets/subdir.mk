################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../dlib/gui_widgets/base_widgets.cpp \
../dlib/gui_widgets/canvas_drawing.cpp \
../dlib/gui_widgets/drawable.cpp \
../dlib/gui_widgets/fonts.cpp \
../dlib/gui_widgets/style.cpp \
../dlib/gui_widgets/widgets.cpp 

OBJS += \
./dlib/gui_widgets/base_widgets.o \
./dlib/gui_widgets/canvas_drawing.o \
./dlib/gui_widgets/drawable.o \
./dlib/gui_widgets/fonts.o \
./dlib/gui_widgets/style.o \
./dlib/gui_widgets/widgets.o 

CPP_DEPS += \
./dlib/gui_widgets/base_widgets.d \
./dlib/gui_widgets/canvas_drawing.d \
./dlib/gui_widgets/drawable.d \
./dlib/gui_widgets/fonts.d \
./dlib/gui_widgets/style.d \
./dlib/gui_widgets/widgets.d 


# Each subdirectory must supply rules for building sources it contributes
dlib/gui_widgets/%.o: ../dlib/gui_widgets/%.cpp
	@echo 'Building file: $<'
	@echo 'Invoking: Cross G++ Compiler'
	g++ -O1 -g3 -Wall -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


