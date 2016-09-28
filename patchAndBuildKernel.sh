#!/bin/bash
# The patch and make process is in two parts
# The first part patches the kernel so that it compiles
# And copies over a file (vgettimeofday.o) that was compiled for 32 bits
# The system is prepared, and the first "make" process is started. It will fail
# because of issues in vdso32, the 32-bit part of the kernel
# In the second part of the patch and make process
# The file vdso32.so.dbg is copied over to vdso32 (which should fix the remaining build issue)
# The kernel and the modules are compiled, and the modules are installed.
# Note that if vdso32.so.dbg is copied before the first make command, it will still fail
# There's probably something in the Makefile for vdso32 that needs the dbg file to be absent
# for it to build itself properly

# patch tegra21_clocks.c
sudo ./scripts/patchKernel.sh
# Untar the vdso32 32-bit files 
tar -xvf vdso32Files.tbz2
sudo cp vgettimeofday.o /usr/src/kernel/arch/arm64/kernel/vdso32
# Start the kernel make process (It should fail, with issues related to vdso32.so.dbg)
sudo ./scripts/makeKernel.sh
# Copy over vdso32.so.dbg, the rest of the kernel should compile
sudo cp vdso32.so.dbg /usr/src/kernel/arch/arm64/kernel/vdso32
# Finish building the kernel, then build the modules and install them
sudo ./scripts/makeKernel1.sh
# Cleanup a little
rm vgettimeofday.o
rm vdso32.so.dbg



