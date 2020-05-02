ifndef TARGET
TARGET		:= $(shell uname -r)
endif

KERNEL_MODULES	:= /lib/modules/$(TARGET)

KERNEL_BUILD	:= $(KERNEL_MODULES)/build

ifneq ("","$(wildcard /boot/System.map-$(TARGET))")
SYSTEM_MAP	:= /boot/System.map-$(TARGET)
else
SYSTEM_MAP	:= /proc/kallsyms
endif

DRIVER := phison
DRIVER_VERSION  := 0.91

MOD_SUBDIR = drivers/ata
MODDESTDIR=$(KERNEL_MODULES)/kernel/$(MOD_SUBDIR)

obj-m	:= $(patsubst %,%.o,$(DRIVER))
obj-ko  := $(patsubst %,%.ko,$(DRIVER))

.PHONY: all modules clean

all: modules

modules:
	@$(MAKE) -C $(KERNEL_BUILD) M=$(CURDIR) $@

clean:
	@$(MAKE) -C $(KERNEL_BUILD) M=$(CURDIR) $@
