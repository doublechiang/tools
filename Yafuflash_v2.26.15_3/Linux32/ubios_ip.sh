#!/bin/bash

show(){
echo "The dafault Username is admin"
echo "            Password is admin" 
echo "Update BIOS firmware:"
echo "${0} <BMC Username> <BMC Password> <BMC IP> <BIOS Image> "
}

Username=$1
Password=$2
BMC_IP=$3
BIOS=$4

if [ "$#" -ne "4" ];
then
	show
	exit 0
fi


connection(){
ping -c 1 $1  >/dev/null
	rc=$?
	if [ "$rc" -eq "1" ]; then
        		echo "Cannot reach BMC, IP:$1"
				exit 0
	fi
}

connection $BMC_IP
./Yafuflash -nw -u $Username -p $Password -vyes -ip $BMC_IP -bios $BIOS
