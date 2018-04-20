#!/bin/bash
# Check to make sure the Image file has been generated
# The "could not stat" error seems to confuse people
if [ -f /usr/src/kernel/kernel-4.4/arch/arm64/boot/Image ] ; then
  echo "Copying Image to /boot diretory"
  sudo ./scripts/copyImage.sh
  echo "Image copied"
else
  tput setaf 1
  echo "==== Image file does not exist ===="
  tput sgr0
  echo "Check for errors in makeKernel"
  echo ""
  echo "Copy failed"
fi

