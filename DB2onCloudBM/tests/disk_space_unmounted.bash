#!/bin/bash

preflight_test () {
    # test disk size

    assigned_number_of_disks=$2
    assigned_size1=$3
    assigned_size2=$4 

    procured_number_of_disks=$(lsblk -b | grep -v sda | grep part | awk '{ print $4 }' | wc -l)

    if [ -z "$procured_number_of_disks" ]; then
        output_fail "Data Disks not found"
    elif [ $assigned_number_of_disks -gt $procured_number_of_disks ]; then
        output_fail "Data Disks missing, found '$procured_number_of_disks', expected '$assigned_number_of_disks'"
    else
        output_ok "'$procured_number_of_disks' Data Disks Found"
    fi
#disktype="ssd"
disktype="disk"
    for x in $(lsblk -b | grep -v sda | grep part | awk '{ print $7 }' | grep $disktype ); do
       output_ok "Disk Type :  + $x "
    done
    if [ -z "$x" ]; then
       output_fail " Disk Type does not match! "
    fi
    y=1
    for x in $(lsblk -b | grep -v sda | grep part | awk '{ print $4 }'); do 
#     for x in $(df -h | grep -v sda | grep disk | awk '{ print $2 }'); do 
        if [ $y -gt 0 ]; then
           procured_size1=$x
           y=0
        else
           procured_size2=$x
        fi
    done 
    if [ $procured_size1 -gt $procured_size2 ]; then
    h=0
    else
       procured_size=$procured_size1
       procured_size1=$procured_size2
       procured_size2=$procured_size 
    fi
        if [ -z "$procured_size1" ]; then
            output_fail "Data Disk size not available"
        elif [ $procured_size1 -gt $assigned_size1  ]; then
            output_fail "Data Disks size not as expected, found '$procured_size1', expected '$assigned_size1'"
        else
           output_ok "Data Disk1 procured with '$procured_size1' vs assigned size '$assigned_size1' "
        fi
        if [ -z "$procured_size2" ]; then
            output_fail "Data Disk size not available"
        elif [ $procured_size2 -gt $assigned_size2  ]; then
            output_fail "Data Disks size not as expected, found '$procured_size2', expected '$assigned_size2'"
        else
           output_ok "Data Disk2 procured with '$procured_size2' vs assigned size '$assigned_size2' "
        fi


}

