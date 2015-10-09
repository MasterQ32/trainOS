﻿# Makefile generated by makedep.

# Tools
RM   = rm
AS   = gcc
CC   = gcc
CXX  = g++
LD   = g++
LEX  = flex
YACC = bison

# File Lists
SRCS_AS  = asm/dynamic.S asm/intr_common_handler.S asm/multiboot.S asm/start.S
SRCS_CC  = src/console.c src/init.c src/interrupts.c src/malloc.c src/pmm.c src/serial.c src/stdlib.c src/timer.c src/vmm.c
SRCS_CXX = src/cplusplus.cpp src/cpp-test.cpp src/vm.cpp csl/cpustatetype.cpp
OBJS     = obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/serial.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/cpp-test.o obj/vm.o obj/cpustatetype.o obj/main.o

# Flags
FLAGS    = -m32 -DCIRCUIT_OS -Dnullptr=0 -D__cdecl="__attribute__((cdecl))" -mno-sse -mno-sse2 -mno-mmx -I/home/felix/projects/Electronics/Electronics/Conductance -I/home/felix/projects/Electronics/Electronics/Tools
ASFLAGS  = -masm=intel
CCFLAGS  = -g -std=c11 -Dnullptr=0 -Wall -g -fno-stack-protector -ffreestanding -Iinclude
CXXFLAGS = -g -std=c++11 -Wall -g -fno-stack-protector -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -Wall -Wextra -ffreestanding -Wno-unused-function -Iinclude
LDFLAGS  = -g -m32 -nostdlib -fno-builtin -Tkernel.ld

# Targets
all: kernel

.PHONY: clean
clean:
	$(RM) obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/serial.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/cpp-test.o obj/vm.o obj/cpustatetype.o obj/main.o

kernel: obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/serial.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/cpp-test.o obj/vm.o obj/cpustatetype.o obj/main.o conductance/assembly.o conductance/compoundtype.o conductance/opcodes.o conductance/string.o conductance/virtualmachine.o conductance/vmpointertype.o conductance/vmprimitivetype.o conductance/vmtype.o conductance/vmvalue.o conductance/vmvoidtype.o
	$(LD) $(FLAGS) $(LDFLAGS) -o $@ obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/serial.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/cpp-test.o obj/vm.o obj/cpustatetype.o obj/main.o conductance/assembly.o conductance/compoundtype.o conductance/opcodes.o conductance/string.o conductance/virtualmachine.o conductance/vmpointertype.o conductance/vmprimitivetype.o conductance/vmtype.o conductance/vmvalue.o conductance/vmvoidtype.o

# src/console.c
obj/console.o: src/console.c include/console.h include/kstdlib.h \
 include/varargs.h include/config.h include/malloc.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/console.c

# src/init.c
obj/init.o: src/init.c include/kernel.h include/kstdlib.h include/varargs.h \
 include/config.h include/malloc.h include/console.h include/interrupts.h \
 include/cpustate.h include/pmm.h include/multiboot.h include/vmm.h \
 include/timer.h include/serial.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/init.c

# src/interrupts.c
obj/interrupts.o: src/interrupts.c include/interrupts.h include/cpustate.h \
 include/console.h include/kstdlib.h include/varargs.h include/config.h \
 include/malloc.h include/io.h src/intr_stubs.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/interrupts.c

# src/malloc.c
obj/malloc.o: src/malloc.c include/config.h include/kernel.h \
 include/kstdlib.h include/varargs.h include/malloc.h include/console.h \
 include/serial.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/malloc.c

# src/pmm.c
obj/pmm.o: src/pmm.c include/pmm.h include/multiboot.h include/kernel.h \
 include/kstdlib.h include/varargs.h include/config.h include/malloc.h \
 include/console.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/pmm.c

# src/serial.c
obj/serial.o: src/serial.c include/io.h include/serial.h include/kstdlib.h \
 include/varargs.h include/config.h include/malloc.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/serial.c

# src/stdlib.c
obj/stdlib.o: src/stdlib.c include/kstdlib.h include/varargs.h \
 include/config.h include/malloc.h include/kernel.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/stdlib.c

# src/timer.c
obj/timer.o: src/timer.c include/timer.h include/kernel.h \
 include/interrupts.h include/cpustate.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/timer.c

# src/vmm.c
obj/vmm.o: src/vmm.c include/config.h include/vmm.h include/pmm.h \
 include/multiboot.h include/kstdlib.h include/varargs.h include/malloc.h \
 include/console.h include/kernel.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/vmm.c

# src/cplusplus.cpp
obj/cplusplus.o: src/cplusplus.cpp include/kstdlib.h include/varargs.h \
 include/config.h include/malloc.h include/console.h include/ker/new.hpp
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c src/cplusplus.cpp

# src/cpp-test.cpp
obj/cpp-test.o: src/cpp-test.cpp include/console.h include/ker/string.hpp \
 include/ker/vector.hpp include/ker/dictionary.hpp include/kernel.h \
 include/ker/pair.hpp
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c src/cpp-test.cpp

# src/vm.cpp
obj/vm.o: src/vm.cpp include/kstdlib.h include/varargs.h include/config.h \
 include/malloc.h include/timer.h include/dynamic.h include/console.h \
 include/interrupts.h include/cpustate.h src/../csl/cpustatetype.hpp
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c src/vm.cpp

# csl/cpustatetype.cpp
obj/cpustatetype.o: csl/cpustatetype.cpp csl/cpustatetype.hpp \
 include/cpustate.h include/console.h
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c csl/cpustatetype.cpp

# asm/dynamic.S
obj/dynamic.o: asm/dynamic.S
	$(AS) $(FLAGS) $(ASFLAGS) -o $@ -c asm/dynamic.S

# asm/intr_common_handler.S
obj/intr_common_handler.o: asm/intr_common_handler.S
	$(AS) $(FLAGS) $(ASFLAGS) -o $@ -c asm/intr_common_handler.S

# asm/multiboot.S
obj/multiboot.o: asm/multiboot.S
	$(AS) $(FLAGS) $(ASFLAGS) -o $@ -c asm/multiboot.S

# asm/start.S
obj/start.o: asm/start.S
	$(AS) $(FLAGS) $(ASFLAGS) -o $@ -c asm/start.S

# Custom Targets

obj/main.o: scripts/main.spark
	/home/felix/projects/Electronics/build-Electronics-Desktop-Debug/bin/spark \
		scripts/main.spark \
		obj/main.ca
	objcopy -B i386 -I binary -O elf32-i386 \
		obj/main.ca obj/main.o
	objcopy  \
		--redefine-sym _binary_obj_main_ca_start=mainscript_start \
		--redefine-sym _binary_obj_main_ca_end=mainscript_end \
		--redefine-sym _binary_obj_main_ca_size=mainscript_size \
		obj/main.o

.PHONY: run
run:
	qemu-system-i386 -serial stdio -kernel kernel

.PHONY: debug
debug:
	qemu-system-i386 -s -S -serial stdio -kernel kernel
