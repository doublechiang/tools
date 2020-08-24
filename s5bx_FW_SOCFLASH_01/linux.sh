#!/bin/sh
res=`service ipmi status`
filename=$1
echo $res | grep 'not' >> /dev/null;
ipmi_status=$?  # start:1 ; stop:0
if [ $ipmi_status -eq 1 ]; then
	echo "############################## caution ##############################"
	echo "# To avoid KCS communication fail, this shell script will stop IPMI #"
	echo "# service automatically before update BMC firmware.                 #"
	echo "#####################################################################"
	res=`service ipmi stop`
fi

pd=`dirname $0`
plat=`uname -m | cut -c 1-6`
soc_exec='soclfash'
if [ "$plat" = "x86_64" ]; then
	soc_exe='socflash_x64'
fi

$pd/linuxflash/$soc_exe -s option=x flashtype=2 if=$filename count=0x4000000

if [ $ipmi_status -eq 1 ]; then
	echo "Waiting for BMC ready, and then start IPMI service..."
	sleep 90
	res=`service ipmi start`
	echo "IPMI service start now !!!"
fi
