#!/bin/bash

preflight_test () {
    # test amount of CPUs

    if [ -z $2 ]; then
        total=4
    else
        total=$2
    fi

    r=$(cat /proc/cpuinfo | grep processor | wc -l)
    if [ $total -gt $r ]; then
	output_fail "CPU found $r cores , expected was $total cores"
    else
        output_ok "CPU procured with $r cores matches with the assigned $total cores"
    fi
}
