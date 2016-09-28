# buildJetsonTX1Kernel
Scripts to help build the kernel and modules onboard the Jetson TX1

These scripts are for building starting from a fresh flash of L4T 24.2 on a NVIDIA Jetson TX1. 

<strong>getKernelSources.sh</strong>

Downloads the kernel sources for L4T 24.2 from the NVIDIA website, decompresses them and opens a graphical editor on the .config file. 

<strong>patchAndBuildKernel.sh</strong>

Applies patches to the kernel, adds 32-bit precompiled compoents, and then compiles the kernel and modules using make.

<strong>copyImage.sh</strong>

Copies the Image and zImage files created by compiling the kernel to the /boot directory


<strong>Note:</strong> that you may want to save the newly built Image, zImage and modules to external media so that can be used to flash a Jetson image, or clone the disk image.


