#!/bin/bash

preflight_test () {

os=$2
osv=$3
  # test OS; should be Red Hat version 7.1
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
