#!/bin/bash

# check the log collection from efi session, if find token, then stop the log collecting.
function check_terminator() {
  while true; do
    if grep -q "SDHGUIPQ" ${logfile} ; then 
      ipmitool -H ${ip} -U ${username} -P ${password} sol deactivate
      break
    fi
   sleep 10
  done
}
  

# Provide the hdd image to remote BMC
if [ $# -ne 3 ]; then
  echo "Usage: $0 [BMC ip address] [username] [password]" 
  exit 1  
fi

ip=$1
username=$2
password=$3
logfile=sol_${ip}.log
VMCLI_RR10/Linux_x86_64/VMCLIEXE -r ${ip}:443 -u ${username} -p ${password} -hd efihd.img > /dev/null 2>&1  &
ipmitool -H ${ip} -U ${username} -P ${password} chassis bootdev floppy options=efiboot
ipmitool -H ${ip} -U ${username} -P ${password} chassis power cycle

# sol console write to stdout, we can't put into backgroup. so invoke the sub process in advance.

rm -f sol_${ip}.log
check_terminator &
ipmitool -H ${ip} -U ${username} -P ${password} -I lanplus sol activate > ${logfile}
pidline=`ps aux | grep "VMCLIEXE.*${ip}"`
vmclipid=`echo ${pidline} | cut -d " " -f 2`
kill ${vmclipid}

