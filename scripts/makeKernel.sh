#!/bin/bash
# Builds the kernel and modules
# Assumes that the .config file is available
cd /usr/src/kernel
make prepare
make modules_prepare
make -j4

