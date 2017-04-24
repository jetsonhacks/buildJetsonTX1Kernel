#!/bin/bash
if [ -z "$1" ]
  then
    DIR="/usr/src"
else
  DIR=$1
fi

cd $DIR/kernel
sudo cp arch/arm64/boot/zImage /boot/zImage
sudo cp arch/arm64/boot/Image /boot/Image


