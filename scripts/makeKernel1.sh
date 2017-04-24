#!/bin/bash
# Finishes building the kernel and modules
# Assumes that the .config file is available
cd $1
make -j4
make modules
make modules_install

