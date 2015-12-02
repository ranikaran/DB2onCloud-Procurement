#!/bin/bash

# CPU number of cores
PF_BI_NUM_CORES=4
export PF_BI_NUM_CORES

# RAM (MB)
PF_BI_RAM=8192
export PF_BI_RAM

# Num of data disks, set 0 for management nodes
NUM_DATA_DISKS=2
export NUM_DATA_DISKS
#NUM_DATA_SIZE1 for SSD1 in bytes
NUM_DATA_SIZE1=107374182400
export NUM_DATA_SIZE1
#NUM_DATA_SIZE2 for SSD2 in bytes
NUM_DATA_SIZE2=536870912000
export NUM_DATA_SIZE2

# Operating System and its version
PF_BI_OS=RHEL
export PF_BI_OS

PF_BI_OS_VERSION=7.1
export PF_BI_OS_VERSION

bash ./DB2onCloud_template.bash
