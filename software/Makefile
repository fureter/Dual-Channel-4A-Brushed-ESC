#export PATH := $(PATH):$(HOME)/local/bin/sdcc

MCU  = STM8S003F3P6
ARCH = stm8
BOARD = STM8S003F

F_CPU   ?= 16000000
TARGET  ?= main.ihx

IO   	 = IOManager/
IM  	 = InitManager/
PR  	 = Programming/
SRCS    := $(wildcard *.c  $(IM)/*.c $(IO)/*.c $(PR)/*.c)
ASRCS   := $(wildcard *.s  $(IM)/*.s $(IO)/*.s $(PR)/*.s)
 
OBJS     = $(SRCS:.c=.rel)
OBJS    += $(ASRCS:.s=.rel)

CC       = sdcc
LD       = sdld
AS       = sdasstm8
OBJCOPY  = sdobjcopy
ASFLAGS  = -plosgff -loff
CFLAGS   = -m$(ARCH) -p$(MCU) --std-c11
CFLAGS  += -DF_CPU=$(F_CPU)UL -D$(BOARD)=1UL -I. -I$(IM) -I$(IO) -I$(PC) -I$(PR) -lm -V
CFLAGS  += --stack-auto --noinduction --use-non-free
## Disable lospre (workaround for bug 2673)
#CFLAGS  += --nolospre
## Extra optimization rules - use with care
#CFLAGS  += --peep-file $(LIBDIR)/util/extra.def
LDFLAGS  = -m$(ARCH) -l$(ARCH) --out-fmt-ihx

all: $(TARGET) size

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

%.rel: %.c
	$(CC) $(CFLAGS) $(INCLUDE) -c $< -o $@

%.rel: %.s
	$(AS) $(ASFLAGS) $<

size:
	@$(OBJCOPY) -I ihex --output-target=binary $(TARGET) $(TARGET).bin
	@echo "----------"
	@echo "Image size:"
	@stat -L -c %s $(TARGET).bin

flash: $(TARGET)
	stm8flash -c stlinkv2 -p $(MCU) -w $(TARGET)

serial: $(TARGET)
	stm8gal -p /dev/ttyUSB0 -w $(TARGET)

clean:
	find . -name \*.map -type f -delete
	find . -name \*.asm -type f -delete
	find . -name \*.ihx -type f -delete
	find . -name \*.o -type f -delete
	find . -name \*.sym -type f -delete
	find . -name \*.lk -type f -delete
	find . -name \*.lst -type f -delete
	find . -name \*.rst -type f -delete
	find . -name \*.cdb -type f -delete
	find . -name \*.bin -type f -delete
	find . -name \*.rel -type f -delete

.PHONY: clean all flash
