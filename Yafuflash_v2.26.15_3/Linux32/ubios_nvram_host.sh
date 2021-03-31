#!/bin/bash

show(){
echo "The dafault Username is admin"
echo "            Password is admin" 
echo "Update BIOS firmware:"
echo "${0} <BMC Username> <BMC Password> <BMC hostname> <BIOS Image> "
}
Username=$1
Password=$2
BMC_hostname=$3
BIOS=$4
if [ "$#" -ne "4" ];
then
	show  #means if the number of positional parameters set is less than 4.
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
./Yafuflash -nw -u $Username -p $Password -vyes -host $BMC_hostname -bios-rbu $BIOS
