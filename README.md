# buildJetsonTX1Kernel
Scripts to help build the 4.4.38 kernel and modules onboard the Jetson TX1 (L4T 28.2, JetPack 3.2). For previous versions, visit the 'tags' section.

<em><strong>Note:</strong> The kernel source version must match the version of firmware flashed on the Jetson. For example, the source for the 4.4.38 kernel here is matched with L4T 28.2. This kernel compiled using this source tree will not work with newer versions or older versions of L4T, only 28.2.</em>


As of this writing, the "official" way to build the Jetson TX1 kernel is to use a cross compiler on a Linux PC. These scripts are an alternative which builds the kernel onboard the Jetson itself. These scripts will download the kernel source to the Jetson TX1 and then compile the kernel and selected modules. The newly compiled kernel can then be installed.

<strong>WARNING:</strong> After flashing the Jetson TX1, there is a limited amount of room on the device. You should modify the kernel directly after flashing the device. After completing these scripts there will be little space left on the device. After building the kernel and modules, you should remove some of the files that were added in the /usr/src directory. You may want to store the /usr/src/kernel directory offboard (like on a SATA drive or USB stick) along with the compressed sources before deleting them as you may want to use them again later.

These scripts are for building the kernel for the 64-bit L4T 28.2 (Ubuntu 16.04 based) operating system on the NVIDIA Jetson TX1. The scripts should be run directly after flashing the Jetson with L4T 28.2 from a host PC. There are five scripts:

<strong>getKernelSources.sh</strong>

Downloads the kernel sources for L4T 28.2 from the NVIDIA website, decompresses them and opens a graphical editor on the .config file. 

<strong>getKernelSourcesNoGUI.sh</strong>

Downloads the kernel sources for L4T 28.2 from the NVIDIA website and decompresses them. This is useful when using SSH, or you prefer a different method of editing the .config file. 

<strong>makeKernel.sh</strong>

This script compiles the kernel and modules using make.

<strong>copyImage.sh</strong>

Copies the Image file created by compiling the kernel to the /boot directory. If you modify the kernel, you will probably want to make a copy of the original kernel image (/boot/Image) before copying over the newly generated one. You will also want to modify /boot/extlinux/extlinux.conf so that you can boot from the new Image or the old Image in case something untowards happens. That way, you will be able to select the old Image through the serial console.

<strong>Note:</strong> The Image file is copied to the boot directory of the current root directory device. The Jetson generally boots from the internal eMMC. If you are developing on external media (such as a SSD or USB drive) you will probably need to manually copy the Image file to the /boot directory of the eMMC. Refer to the script for the location of the Image file in the source tree.

<strong>removeAllKernelSources.sh</strong>
Removes all of the kernel sources and compressed source files. You may want to make a backup of the files before deletion.


<strong>Notes:</strong> 

These scripts make only the kernel Image and Modules. You will need to modify the scripts if more are needed.

<strong>IMPORTANT</strong> The copyImage.sh script copies the Image to the current device. If you are building the kernel on an external device, for example a SSD, you will want to copy the Image file over to the eMMC in the eMMC /boot directory if you are booting from the eMMC and using external storage as your root directory. 

Special thanks to Raffaello Bonghi (https://github.com/rbonghi) for jeston_easy scripts.


### Release Notes
April, 2018
* v1.0-L4T28.2
* L4T 28.2 (JetPack 3.2)
* Add getKernelSourcesNoGUI.sh for cases where the user does not want to edit the .config file through a GUI.
* Add removeAllSources.sh for removing kernel sources and compressed files after the kernel is built.
* Check to make sure that the version of the kernel matches the sources to download

March, 2018
* v1.0-L4T28.1
* L4T 28.1 (JetPack 3.1)

July, 2017
* v1.0-L4T24.2.1
* L4T 24.2.1 

April, 2017
* Initial Release
* v1.0-L4T24.2
* L4T 24.2

## License
MIT License

Copyright (c) 2017-2018 Jetsonhacks
Copyright (c) 2015-2018 Raffaello Bonghi (jetson_easy)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.






