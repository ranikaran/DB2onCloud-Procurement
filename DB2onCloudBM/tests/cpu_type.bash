#!/bin/bash

preflight_test () {
    # test CPU type

    procuredValue=$(cat /proc/cpuinfo | grep 'model name' | grep $2 | wc -l)

    if [ $procuredValue -gt 0 ]; then
        output_ok "CPU Type $PF_BI_CPU_TYPE"
    else
        output_fail "CPU Type"
     fi
}
