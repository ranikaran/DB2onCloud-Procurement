#!/bin/bash

preflight_test () {
    # test CPU type

    r=$(cat /proc/cpuinfo | grep 'model name' | grep $2 | wc -l)
   
    if [ $r -gt 0 ]; then
        output_ok "CPU Type $PF_BI_CPU_TYPE"
    else 
	output_fail "CPU Type"
     fi
}
