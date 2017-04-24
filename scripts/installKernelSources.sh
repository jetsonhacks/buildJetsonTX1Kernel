#!/bin/bash
apt-add-repository universe
apt-get update
apt-get install libqt4-dev pkg-config -y
if [ -z "$1" ]
  then
    DIR="/usr/src"
else
  DIR=$1
fi

cd $DIR
# Currently the NVIDIA certificate is self signed, so don't check it
wget --no-check-certificate http://developer.nvidia.com/embedded/dlc/l4t-sources-24-2-1 -O l4t-sources-24-2-1.tbz2
tar -xvf l4t-sources-24-2-1.tbz2 sources/kernel_src.tbz2
rm l4t-sources-24-2-1.tbz2
tar -xvf sources/kernel_src.tbz2
rm -rf sources
cd kernel
zcat /proc/config.gz > .config
make xconfig

