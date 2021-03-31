#!/bin/bash

show(){
echo "The dafault Username is admin"
echo "            Password is admin" 
echo "Update BMC firmware:"
echo "${0} <BMC username> <BMC password> <BMC hostname> <BMC Image> "
}

Username=$1
Password=$2
BMC_hostname=$3
BMC=$4

if [ "$#" -ne "4" ];
then
	show
	exit 0
fi


connection(){
ping -c 1 $1  >/dev/null
	rc=$?
	if [ "$rc" -eq "1" ]; then
        		echo "Cannot reach BMC, Hostname:$1"
				exit 0
	fi
}

connection $BMC_hostname
./Yafuflash -nw -u $Username -p $Password -vyes -host $BMC_hostname $BMC
