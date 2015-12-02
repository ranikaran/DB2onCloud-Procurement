#!/bin/bash

preflight_test () {

os=$2
osv=$3
  # test OS; should be debian 6 or 7 or ubuntu 12.04 or 14.04
  if [[ -e /etc/redhat-release ]];
  then
    ver=$(cat /etc/redhat-release | awk '{print $7}')
    output_ok "Operating System : RHEL"
    if [ "$ver" == "$osv" ]; then  
      output_ok "OS Version : $ver "
    fi
  else
  output_fail "Operating System"
  fi

}
