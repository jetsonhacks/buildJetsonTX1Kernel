# buildJetsonTX1Kernel
Scripts to help build the kernel and modules onboard the Jetson TX1

These scripts are for building 64-bit L4T 24.2 (Ubuntu 16.04 based) operating system on the NVIDIA Jetson TX1. The scripts should be run directly after flashing the Jetson with L4T 24.2 from a host PC. See JetsonHacks.com for article:

http://jetsonhacks.com/2016/09/28/build-tx1-kernel-and-modules-nvidia-jetson-tx1/

<strong>getKernelSources.sh</strong>

Downloads the kernel sources for L4T 24.2 from the NVIDIA website, decompresses them and opens a graphical editor on the .config file. 

<strong>patchAndBuildKernel.sh</strong>

Applies patches to the kernel, adds 32-bit precompiled compoents, and then compiles the kernel and modules using make.

<strong>copyImage.sh</strong>

Copies the Image and zImage files created by compiling the kernel to the /boot directory


<strong>Note:</strong> that you may want to save the newly built Image, zImage and modules to external media so that can be used to flash a Jetson image, or clone the disk image.


