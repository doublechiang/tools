#!/bin/bash
# Under MAC OS, mount sshfs of remote server
if [ $# -ne 3 ]; then
    echo "Usage: $0 [ip] [username] [password]"; exit 1;
fi
ip=$1
user=$2
pass=$3

cmd="ipmitool -H ${ip} -U ${user} -P ${pass} -I lanplus sol activate"
echo $cmd
eval ${cmd}
 