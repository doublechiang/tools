#!/bin/sh




ip=$1
pwd=$2
image=$3

cd linuxflash

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   cd Linux_x86_64
   echo ""
   echo Linux x86_64 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -d 4 -nw -ip $ip -u admin -p $pwd ../../$image
else
   cd Linux_x86_32
   echo ""
   echo Linux x86 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -d 4 -nw -ip $ip -u admin -p $pwd ../../$image
fi

cd ../..