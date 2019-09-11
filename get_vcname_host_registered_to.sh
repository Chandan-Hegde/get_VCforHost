#!/bin/bash

if [ "$1" == '' ]; then echo "$0 hostname"; exit; fi

HOST=$1

IP=$(ssh -n -o ConnectTimeout=3 $HOST 2>/dev/null "egrep serverIp '/etc/vmware/vpxa/vpxa.cfg'  | cut -d \">\" -f 2 | cut -d \"<\" -f 1")

green=`tput setaf 2`
reset=`tput sgr0`

echo -n "vCenter to which host $1 registered is : ${green}"
host $IP | awk '{print $NF}'
echo "${reset}"
