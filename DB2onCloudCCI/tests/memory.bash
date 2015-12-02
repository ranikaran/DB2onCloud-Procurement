#!/bin/bash

preflight_test () {
    # test amount of ram

    if [ -z $2 ]; then
        assignedValue=8000
    else
        assignedValue=$2
    fi

    procuredValue=$(free -m | grep "Mem:" | awk '{ print $2 }')

    if [ $assignedValue -gt $procuredValue ]; then
       output_fail "Memory ($assignedValue/$procuredValue MB)"

    else 
	output_ok "Memory ($assignedValue/$procuredValue MB)"
    fi

}
