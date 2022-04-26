##########################################################################################################################
# File automatically-generated by tool: [projectgenerator] version: [3.13.0-B3] date: [Sun Apr 25 13:09:03 EDT 2021] 
##########################################################################################################################

# ------------------------------------------------
# Generic Makefile (based on gcc)
#
# ChangeLog :
#	2017-02-10 - Several enhancements + project update mode
#   2015-07-22 - first version
# ------------------------------------------------

######################################
# target
######################################
TARGET = GD32F330F8_RTTHREAD_MK


######################################
# building variables
######################################
# debug build?
DEBUG = 1
# optimization
OPT = -Og


#######################################
# paths
#######################################
# Build path
BUILD_DIR = build

######################################
# source
######################################
# C sources
C_SOURCES =  \
Drivers/CMSIS/GD/GD32F3x0/Source/system_gd32f3x0.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_ctc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_gpio.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_fmc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_rtc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_pmu.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_spi.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_wwdgt.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_usart.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_syscfg.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_dbg.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_i2c.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_rcu.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_adc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_dac.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_dma.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_fwdgt.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_cec.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_exti.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_crc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_cmp.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_misc.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_tsi.c \
Drivers/GD32F3x0_standard_peripheral/Source/gd32f3x0_timer.c \
Src/main.c \
Src/gd32f3x0_it.c \
rt-thread/board.c \
rt-thread/libcpu/arm/common/backtrace.c \
rt-thread/libcpu/arm/common/div0.c \
rt-thread/libcpu/arm/common/showmem.c \
rt-thread/libcpu/arm/cortex-m4/cpuport.c \
rt-thread/src/thread.c \
rt-thread/src/components.c \
rt-thread/src/slab.c \
rt-thread/src/timer.c \
rt-thread/src/object.c \
rt-thread/src/irq.c \
rt-thread/src/cpu.c \
rt-thread/src/kservice.c \
rt-thread/src/mem.c \
rt-thread/src/mempool.c \
rt-thread/src/clock.c \
rt-thread/src/memheap.c \
rt-thread/src/ipc.c \
rt-thread/src/scheduler.c \
rt-thread/src/idle.c

# ASM sources
ASM_SOURCES =

ASM_SOURCES_S =  \
Drivers/CMSIS/GD/GD32F3x0/Source/GCC/startup_gd32f3x0.S \
rt-thread/libcpu/arm/common/divsi3.S \
rt-thread/libcpu/arm/cortex-m4/context_gcc.S

#######################################
# binaries
#######################################
PREFIX = arm-none-eabi-
# The gcc compiler bin path can be either defined in make command via GCC_PATH variable (> make GCC_PATH=xxx)
# either it can be added to the PATH environment variable.
ifdef GCC_PATH
CC = $(GCC_PATH)/$(PREFIX)gcc
AS = $(GCC_PATH)/$(PREFIX)gcc -x assembler-with-cpp
CP = $(GCC_PATH)/$(PREFIX)objcopy
SZ = $(GCC_PATH)/$(PREFIX)size
else
CC = $(PREFIX)gcc
AS = $(PREFIX)gcc -x assembler-with-cpp
CP = $(PREFIX)objcopy
SZ = $(PREFIX)size
endif
HEX = $(CP) -O ihex
BIN = $(CP) -O binary -S
 
#######################################
# CFLAGS
#######################################
# cpu
CPU = -mcpu=cortex-m4

# fpu
FPU = -mfpu=fpv4-sp-d16

# float-abi
FLOAT-ABI = -mfloat-abi=hard

# mcu
MCU = $(CPU) -mthumb $(FPU) $(FLOAT-ABI)

# macros for gcc
# AS defines
AS_DEFS = 

# C defines
C_DEFS =  \
-DGD32F3x0 \
-DGD32F330


# AS includes
AS_INCLUDES = 

# C includes
C_INCLUDES =  \
-IInc \
-IDrivers/GD32F3x0_standard_peripheral/Include \
-IDrivers/CMSIS/GD/GD32F3x0/Include \
-IDrivers/CMSIS \
-Irt-thread/include \
-Irt-thread/include/libc \
-Irt-thread


# compile gcc flags
ASFLAGS = $(MCU) $(AS_DEFS) $(AS_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections

CFLAGS = $(MCU) $(C_DEFS) $(C_INCLUDES) $(OPT) -Wall -fdata-sections -ffunction-sections -Xassembler -mimplicit-it=always

ifeq ($(DEBUG), 1)
CFLAGS += -g -gdwarf-2
endif


# Generate dependency information
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)"


#######################################
# LDFLAGS
#######################################
# link script
LDSCRIPT = GD32F330F8_DEFAULT.ld

# libraries
LIBS = -lc -lm -lnosys 
LIBDIR = 
LDFLAGS = $(MCU) -specs=nano.specs -T$(LDSCRIPT) $(LIBDIR) $(LIBS) -Wl,-Map=$(BUILD_DIR)/$(TARGET).map,--cref -Wl,--gc-sections

# default action: build all
all: $(BUILD_DIR)/$(TARGET).elf $(BUILD_DIR)/$(TARGET).hex $(BUILD_DIR)/$(TARGET).bin


#######################################
# build the application
#######################################
# list of objects
OBJECTS = $(addprefix $(BUILD_DIR)/,$(notdir $(C_SOURCES:.c=.o)))
vpath %.c $(sort $(dir $(C_SOURCES)))
# list of ASM program objects
OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES:.s=.o)))
vpath %.s $(sort $(dir $(ASM_SOURCES)))

OBJECTS += $(addprefix $(BUILD_DIR)/,$(notdir $(ASM_SOURCES_S:.S=.o)))
vpath %.S $(sort $(dir $(ASM_SOURCES_S)))


$(BUILD_DIR)/%.o: %.c Makefile | $(BUILD_DIR) 
	$(CC) -c $(CFLAGS) -Wa,-a,-ad,-alms=$(BUILD_DIR)/$(notdir $(<:.c=.lst)) $< -o $@

$(BUILD_DIR)/%.o: %.s Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/%.o: %.S Makefile | $(BUILD_DIR)
	$(AS) -c $(CFLAGS) $< -o $@

$(BUILD_DIR)/$(TARGET).elf: $(OBJECTS) Makefile
	$(CC) $(OBJECTS) $(LDFLAGS) -o $@
	$(SZ) $@

$(BUILD_DIR)/%.hex: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(HEX) $< $@
	
$(BUILD_DIR)/%.bin: $(BUILD_DIR)/%.elf | $(BUILD_DIR)
	$(BIN) $< $@	
	
$(BUILD_DIR):
	mkdir $@		

#######################################
# clean up
#######################################
clean:
	-rm -fR $(BUILD_DIR)
  
#######################################
# dependencies
#######################################
-include $(wildcard $(BUILD_DIR)/*.d)

# *** EOF ***