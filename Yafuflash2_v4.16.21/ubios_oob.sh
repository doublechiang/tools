#!/bin/sh
ip=$1
user=$2
pass=$3
image=$4

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   PLAT="Linux_x86_64"
else
   PLAT="Linux_x86_32"
fi
./linuxflash/${PLAT}/Yafuflash2 -d 2 -nw -ip $ip -u $user -p $pass $image

