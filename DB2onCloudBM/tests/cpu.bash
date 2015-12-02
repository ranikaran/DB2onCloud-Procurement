#!/bin/bash

preflight_test () {
    # test amount of CPUs

    if [ -z $2 ]; then
        assignedCores=4
    else
        assignedCores=$2
    fi

    procuredCores=$(cat /proc/cpuinfo | grep processor | wc -l)
    if [ $assignedCores -gt $procuredCores ]; then
        output_fail "CPU found $procuredCores cores , expected was $assignedCores cores"
    else
        output_ok "CPU procured with $procuredCores cores matches with the assigned $assignedCores cores"
    fi
}
