# trainOS

## Description
An operating system built around the language "trainscript"
which is used to execute all user code in a virtual machine.

## Current status:
The vm can execute some code and is able to call native code.
Also it leaks memory. A lot of memory.

## Screenshots
![Screenshot of current version]
(http://s.mq32.de/?x6a3)

## Todo List
- Fix memory leaks
 - Validation code leaks memory
 - ???
- Improve virtual machine / trainScript
 - Add support for feature restriction
 - Add variable modifier `SHARED`: C/C++ `static` counterpart
 - Add JIT compiler with thunkers
- Improve kernel
 - Add support for "delegates" (callback + state): `void callback(void *state)

## Guidlines
- Calls to `die` or `die_extra` should follow the following scheme: `ContextName.ErrorName`

## Kernel Architecture
The kernel is a simple kernel that does not utilize paging. It has simple interrupt management where an
interrupt handler can be registerd for each interrupt.

### Bootstrapping
1. Setup 16 kB stack space
2. Clear screen and print boot message
3. Initialize physical memory management (page allocator)
4. Initialize interrupts
5. Enable hardware interrupts
6. Initialize timer
7. Initialize C++ support
8. Register status bar timer callback
9. Start virtual machine (and run OS)
10. Disable hardware interrupts
11. Print stop message

### Memory Allocation
The kernel features a simple malloc structure that allocates memor between 0x400000 and 0x800000 (4 MB heap space).

The allocator can be configured to "secure" its allocation list with a magic number by defining `USE_MAGIC_SECURED_MALLOC` in `config.h`.

It also features a surveillance mode that logs all allocations / frees. It can be enabled by defining `USE_VERBOSE_MALLOC` and `USE_VERBOSE_FREE` in `config.h`.

### Interrupt Mapping
|Number     | Interrupt         |
|-----------|-------------------|
|0x00 - 0x1F|System Interrupts  |
|0x20 - 0x27| IRQ0 - IRQ7       |
|0x28 - 0x2F| IRQ8 - IRQ15      |
