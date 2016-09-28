#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install libqt4-dev pkg-config -y
cd /usr/src
wget http://developer.download.nvidia.com/embedded/L4T/r24_Release_v2.0/BSP/sources.tbz2
tar -xvf sources.tbz2 source/kernel_src.tbz2
tar -xvf source/kernel_src.tbz2
cd kernel
zcat /proc/config.gz > .config
make xconfig

