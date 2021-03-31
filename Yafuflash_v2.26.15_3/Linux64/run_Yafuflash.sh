#!/bin/bash

function printHelp () {
cat <<EOF
Command Usages:
    $PROGRAM_NAME <BMC IP> <BMC FW Image 1> <BMC FW Image 2>
EOF
exit 0
}

if [ $# -ne 3 ]
then
	printHelp
	exit 0
fi

auth="-U admin -P admin"
auth1="-u admin -p admin"
preserve_items="-vdbg -preserve-sel -preserve-ipmi -preserve-net -preserve-snmp -preserve-ssh -preserve-kvm -preserve-auth -preserve-syslog"

BMCIP=$1
BMCImage1=$2
BMCImage2=$3

count=0
step_cur=0
while true
do
	count=$(($count+1))
	echo "@@@@@@@ count is $count @@@@@@@"

	if [ $step_cur == 0 ];then
	    ./Yafuflash $auth1 -ip $BMCIP -vyes -nw $preserve_items $BMCImage1 || exit $?
	    step_cur=1
	    printf "[ Info ] it succeed in updating BMC FW and wait for BMC ready"
	    sleep 90
	fi

	if [ $step_cur == 1 ];then
	    ./Yafuflash $auth1 -ip $BMCIP -vyes -nw $preserve_items $BMCImage2 || exit $?
	    step_cur=0
	    printf "[ Info ] it succeed in updating BMC FW and wait for BMC ready"
	    sleep 90
	fi
done


