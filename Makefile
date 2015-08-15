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
SRCS_CC  = src/console.c src/init.c src/interrupts.c src/malloc.c src/pmm.c src/stdlib.c src/timer.c src/vmm.c
SRCS_CXX = trainscript/tsvm.cpp src/cplusplus.cpp src/vm.cpp obj/trainscript.yy.cpp obj/trainscript.tab.cpp
OBJS     = obj/tsvm.o obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/vm.o obj/trainscript.yy.o obj/trainscript.tab.o obj/main.o

# Flags
FLAGS    = -m32 -Dnullptr=0 -D__cdecl="__attribute__((cdecl))" -mno-sse -mno-sse2 -mno-mmx
ASFLAGS  = -masm=intel
CCFLAGS  = -g -std=c11 -Dnullptr=0 -Wall -g -fno-stack-protector -ffreestanding -Iinclude
CXXFLAGS = -g -std=c++11 -Wall -g -fno-stack-protector -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -Wall -Wextra -ffreestanding -Wno-unused-function -Iinclude
LDFLAGS  = -g -m32 -nostdlib -fno-builtin -Tkernel.ld

# Targets
all: kernel

.PHONY: clean
clean:
	$(RM) obj/trainscript.yy.cpp obj/trainscript.tab.cpp obj/tsvm.o obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/vm.o obj/trainscript.yy.o obj/trainscript.tab.o obj/main.o

kernel: obj/tsvm.o obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/vm.o obj/trainscript.yy.o obj/trainscript.tab.o obj/main.o
	$(LD) $(FLAGS) $(LDFLAGS) -o $@ obj/tsvm.o obj/dynamic.o obj/intr_common_handler.o obj/multiboot.o obj/start.o obj/console.o obj/init.o obj/interrupts.o obj/malloc.o obj/pmm.o obj/stdlib.o obj/timer.o obj/vmm.o obj/cplusplus.o obj/vm.o obj/trainscript.yy.o obj/trainscript.tab.o obj/main.o

# src/console.c
obj/console.o: src/console.c include/console.h include/stdlib.h \
 include/varargs.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/console.c

# src/init.c
obj/init.o: src/init.c include/kernel.h include/stdlib.h include/varargs.h \
 include/console.h include/interrupts.h include/cpustate.h include/pmm.h \
 include/multiboot.h include/vmm.h include/timer.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/init.c

# src/interrupts.c
obj/interrupts.o: src/interrupts.c include/interrupts.h include/cpustate.h \
 include/console.h include/stdlib.h include/varargs.h include/io.h \
 src/intr_stubs.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/interrupts.c

# src/malloc.c
obj/malloc.o: src/malloc.c include/stdlib.h include/varargs.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/malloc.c

# src/pmm.c
obj/pmm.o: src/pmm.c include/pmm.h include/multiboot.h include/kernel.h \
 include/stdlib.h include/varargs.h include/console.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/pmm.c

# src/stdlib.c
obj/stdlib.o: src/stdlib.c include/stdlib.h include/varargs.h \
 include/kernel.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/stdlib.c

# src/timer.c
obj/timer.o: src/timer.c include/timer.h include/kernel.h \
 include/interrupts.h include/cpustate.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/timer.c

# src/vmm.c
obj/vmm.o: src/vmm.c include/vmm.h include/pmm.h include/multiboot.h \
 include/stdlib.h include/varargs.h include/console.h include/kernel.h
	$(CC)  $(FLAGS) $(CCFLAGS) -o $@ -c src/vmm.c

# trainscript/tsvm.cpp
obj/tsvm.o: trainscript/tsvm.cpp include/stdlib.h include/varargs.h \
 include/console.h trainscript/common.h trainscript/tsvm.hpp \
 include/ker/string.hpp include/ker/vector.hpp include/ker/new.hpp \
 include/ker/dictionary.hpp include/kernel.h include/ker/pair.hpp \
 trainscript/typeid.hpp trainscript/trainscript.tab.hpp \
 trainscript/trainscript.l.h include/string.h
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c trainscript/tsvm.cpp

# src/cplusplus.cpp
obj/cplusplus.o: src/cplusplus.cpp include/stdlib.h include/varargs.h \
 include/console.h include/ker/new.hpp
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c src/cplusplus.cpp

# src/vm.cpp
obj/vm.o: src/vm.cpp include/stdlib.h include/varargs.h include/timer.h \
 include/dynamic.h src/../trainscript/tsvm.hpp include/console.h \
 include/ker/string.hpp include/ker/vector.hpp include/ker/new.hpp \
 include/ker/dictionary.hpp include/kernel.h include/ker/pair.hpp \
 src/../trainscript/typeid.hpp
	$(CXX)  $(FLAGS) $(CXXFLAGS) -o $@ -c src/vm.cpp

# obj/trainscript.yy.cpp
obj/trainscript.yy.o: obj/trainscript.yy.cpp include/string.h \
 include/stdlib.h include/varargs.h trainscript/common.h \
 trainscript/tsvm.hpp include/console.h include/ker/string.hpp \
 include/ker/vector.hpp include/ker/new.hpp include/ker/dictionary.hpp \
 include/kernel.h include/ker/pair.hpp trainscript/typeid.hpp \
 obj/trainscript.tab.hpp
	$(CXX) -iquotetrainscript $(FLAGS) $(CXXFLAGS) -o $@ -c obj/trainscript.yy.cpp

# obj/trainscript.tab.cpp
obj/trainscript.tab.o: obj/trainscript.tab.cpp include/stdlib.h \
 include/varargs.h trainscript/common.h trainscript/tsvm.hpp \
 include/console.h include/ker/string.hpp include/ker/vector.hpp \
 include/ker/new.hpp include/ker/dictionary.hpp include/kernel.h \
 include/ker/pair.hpp trainscript/typeid.hpp trainscript/trainscript.l.h \
 include/string.h
	$(CXX) -iquotetrainscript $(FLAGS) $(CXXFLAGS) -o $@ -c obj/trainscript.tab.cpp

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

obj/trainscript.yy.cpp: trainscript/trainscript.l
	$(LEX) --header-file=trainscript/trainscript.l.h -o obj/trainscript.yy.cpp -d trainscript/trainscript.l

obj/trainscript.tab.cpp: trainscript/trainscript.y
	$(YACC) -o obj/trainscript.tab.cpp -d trainscript/trainscript.y

# Custom Targets
obj/main.o: scripts/main.ts
	objcopy -B i386 -I binary -O elf32-i386 \
		scripts/main.ts obj/main.o
	objcopy  \
		--redefine-sym _binary_scripts_main_ts_start=mainscript_start \
		--redefine-sym _binary_scripts_main_ts_end=mainscript_end \
		--redefine-sym _binary_scripts_main_ts_size=mainscript_size \
		obj/main.o


.PHONY: run
run:
	qemu-system-i386 -kernel kernel kernel
