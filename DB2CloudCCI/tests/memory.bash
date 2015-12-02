#!/bin/bash

preflight_test () {
    # test amount of ram

    if [ -z $2 ]; then
        assignedValue=8000
    else
        assignedValue=$2
    fi

    #keeping the memory range as 10% of assigned memory
    memoryRange=$3
    procuredValue=$(free -m | grep "Mem:" | awk '{ print $2 }')

    if [ $procuredValue -gt $assignedValue ]; then
       output_fail "Memory ($assignedValue/$procuredValue MB)"

    elif [ $procuredValue -eq $assignedValue ]; then
	output_ok "Memory procured with $procuredValue vs assigned $assignedValue"

    elif [ $procuredValue -gt $memoryRange ] && [ $procuredValue -lt $assignedValue ]; then    
        output_ok "Memory procured with $procuredValue vs assigned $assignedValue"
   
    else 
	output_fail "Memory ($assignedValue/$procuredValue MB)"
    fi

}
