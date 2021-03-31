#!/bin/bash

function printHelp () {
cat <<EOF
Command Usages:
    $PROGRAM_NAME <BMC IP> <BMC FW Image>
EOF
exit 0
}

if [ $# -ne 2 ]
then
	printHelp
	exit 0
fi

auth="-U admin -P admin"
auth1="-u admin -p admin"

BMCIP=$1
BMCImage1=$2
Yafuflash="Yafuflash"

while true
do
	count=$(($count+1))
	echo "@@@@@@@ count is $count @@@@@@@"

	$Yafuflash $auth1 -ip $BMCIP -vyes -vdbg -nw -bios $BMCImage1 || exit $?

	sleep 20
done


