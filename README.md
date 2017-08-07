# buildJetsonTX1Kernel
Scripts to help build the 4.4.38 kernel and modules onboard the Jetson TX1 (L4T 28.1, JetPack 3.1). For previous versions, visit the 'tags' section.

As of this writing, the "official" way to build the Jetson TX1 kernel is to use a cross compiler on a Linux PC. These scripts are an alternative which builds the kernel onboard the Jetson itself. These scripts will download the kernel source to the Jetson TX1, wrangle some of the Makefiles to make them work on the Jetson, and then compile the kernel and selected modules. The newly compiled kernel can then be installed.

WARNING: After flashing the Jetson TX1, there is a limited amount of room on the device. After completing these scripts there will be NO space on the device. You MUST remove some of the files that were added in the /usr/src directory. You should store the /usr/src/kernel directory offboard (like on a SATA drive or USB stick) along with the compressed sources before deleting them. You may want to use them again later.

These scripts are for building the kernel for the 64-bit L4T 28.1 (Ubuntu 16.04 based) operating system on the NVIDIA Jetson TX1. The scripts should be run directly after flashing the Jetson with L4T 28.1 from a host PC. There are three scripts:

<strong>getKernelSources.sh</strong>

Downloads the kernel sources for L4T 28.1 from the NVIDIA website, decompresses them and opens a graphical editor on the .config file. 

<strong>makeKernel.sh</strong>

This script applies a few patches to makefiles in the kernel source, and then compiles the kernel and modules using make.

<strong>copyImage.sh</strong>

Copies the Image file created by compiling the kernel to the /boot directory

<strong>Notes:</strong> 

The kernel source files are downloaded in a .tgz2 format. After compilation you may want to remove those files. The files are located in /usr/src You will need to use sudo to remove the files, as they are in a system area. The work directory 'sources' contains kernel_src-txt1.tbz2, you can remove that directory. The file 'source_release.tbz2' is a much larger file that holds the kernel sources as well as many other TX1 specific source packages. You can make a backup of source_release.tbz2 before deleting it.

You may want to save the newly built Image and modules to external media so that can be used to flash a Jetson image, or clone the disk image.

These scripts make only the kernel Image and Modules. You will need to modify the scripts if more are needed.

The copyImage.sh script copies the Image to the current device. If you are building the kernel on an external device, for example a SSD, you will want to copy the Image file over to the eMMC in the eMMC /boot directory if you are booting from the eMMC and using external storage as your root directory. 




