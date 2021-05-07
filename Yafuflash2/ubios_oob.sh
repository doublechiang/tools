#!/bin/sh
ip=$1
user=$2
pass=$3
image=$4

pd=`dirname $0`
plat=`uname -m | cut -c 1-6`
arch='Linux_x86_32'
if [ "$plat" = "x86_64" ]; then
	arch='Linux_x86_64'
fi

$pd/linuxflash/${arch}/Yafuflash2 -d 2 -nw -ip $ip -u $user -p $pass $image

