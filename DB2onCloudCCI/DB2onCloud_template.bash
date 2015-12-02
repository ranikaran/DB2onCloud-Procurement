#!/bin/bash
# preflight for bi node

if [ -f "$(dirname $0)/util.bash" ]; then
    source "$(dirname $0)/util.bash"
else
    curl -s -O "https://raw.githubusercontent.com/ranikaran/DB2onCloud-Procurement/master/DB2onCloudCCI/util.bash"
    source util.bash
    rm util.bash
fi

# test CPU total (cores)
run_test "cpu" $PF_BI_NUM_CORES

# test total memory (MB)
run_test "memory" $PF_BI_RAM 

#test number of disks, type and size
#first param num of disks, second param size in GB, third param size in TB
run_test "disk_space_unmounted" $NUM_DATA_DISKS $NUM_DATA_SIZE1 $NUM_DATA_SIZE2

# check OS and Version
run_test "os" $PF_BI_OS $PF_BI_OS_VERSION


# test network (nics and bonds) ('yum install net-tools' is required for ifconfig)
#run_test "network" 4 2

#$(cat out | sendmail ranikaran@us.ibm.com)
exit_now
