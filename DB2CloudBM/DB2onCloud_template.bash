#!/bin/bash
# preflight for bi node

if [ -f "$(dirname $0)/util.bash" ]; then
    source "$(dirname $0)/util.bash"
else
    curl -s -O "https://raw.githubusercontent.com/ehaas-cds/preflight/master/util.bash"
    source util.bash
    rm util.bash
fi

# check if RHEL is registered
#run_test "RHEL_subscription"

# test CPU total (cores)
run_test "cpu" $PF_BI_NUM_CORES

# test CPU Type
run_test "cpu_type" $PF_BI_CPU_TYPE

# test total memory (MB)
run_test "memory" $PF_BI_RAM $MEMORY_RANGE

# test raid
#run_test "RAID"

# test data disk (KB)
#num_of_disks=$NUM_DATA_DISKS
#for i in `seq 1 $num_of_disks`;
#do
#        run_test "disk_space" "/disk"$i 3600000000
#done

# unmounted tests - first param num of disks, second param size in TB, third param size in GB
# if [ $NUM_DATA_DISKS -gt 0 ]; then
  run_test "disk_space_unmounted" $NUM_DATA_DISKS $NUM_DATA_SIZE1 $NUM_DATA_SIZE2
# fi

# check OS and Version
  run_test "os" $PF_BI_OS $PF_BI_OS_VERSION


#run_test "filesystem_type" "/" "ext3" "ext4"

# test network (nics and bonds) ('yum install net-tools' is required for ifconfig)
#run_test "network" 4 2

# test srv device
#run_test "device_size" "/dev/sdb" 1500000000000
# check if /srv mounted
#if mount | grep "/srv" > /dev/null; then
#    run_test "filesystem_type" "/srv" "ext4"
#fi

# test jumbo frames
#run_test "jumbo_frames" "lb1.meritage.cloudant.net"

# test OS
#run_test "os"

# test OS disk (GB)
#test partition spaces
# run_test "partition_space" "$PF_BI_PARTITION_DETAILS"

# clean os
# run_test "clean_os"
# $(cat out | sendmail ranikaran@us.ibm.com)
exit_now
