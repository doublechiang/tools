#!/bin/sh
echo ""
echo BMC firmware image: $filename

ip=$1
username=$2
password=$3
filename=$4

pd=`dirname $0`
plat=`uname -m | cut -c 1-6`
arch='Linux_x86_32'
if [ "$plat" = "x86_64" ]; then
	arch='Linux_x86_64'
fi

$pd/linuxflash/$arch/Yafuflash2 -vyes -nw -ip $ip -u $username -p $password -fb $filename
