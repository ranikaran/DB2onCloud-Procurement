#!/bin/bash

# CPU number of cores
PF_BI_NUM_CORES=64
export PF_BI_NUM_CORES

# CPU type
PF_BI_CPU_TYPE="E5-4650"
export PF_BI_CPU_TYPE

# RAM (MB)
PF_BI_RAM=1048576
export PF_BI_RAM
MEMORY_RANGE=943718
export MEMORY_RANGE

# Num of data disks, set 0 for management nodes
NUM_DATA_DISKS=2
export NUM_DATA_DISKS
#NUM_DATA_SIZE1 for disk1 in bytes
NUM_DATA_SIZE1=10995116277760
export NUM_DATA_SIZE1
#NUM_DATA_SIZE2 for disk2 in bytes
NUM_DATA_SIZE2=858993459200
export NUM_DATA_SIZE2


# Operating System and its version
PF_BI_OS=RHEL
export PF_BI_OS

PF_BI_OS_VERSION=7.1
export PF_BI_OS_VERSION

bash ./DB2onCloud_template.bash
