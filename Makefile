RM := rm
SH := bash

ELFBOOT_TOOLCHAIN_TARGET := i686
ELFBOOT_TOOLCHAIN_SCRIPT := build-toolchain.sh

PHONY :=

PHONY += all
all: $(ELFBOOT_TOOLCHAIN_SCRIPT)
	$(SH) $(ELFBOOT_TOOLCHAIN_SCRIPT) $(ELFBOOT_TOOLCHAIN_TARGET)

PHONY += clean
clean:
	$(RM) -rf bin/
	$(RM) -rf binutils-build/
	$(RM) -rf gcc-build/
	$(RM) -rf i686-elfboot/
	$(RM) -rf lib/
	$(RM) -rf libexec/
	$(RM) -rf share/

.PHONY: $(PHONY)