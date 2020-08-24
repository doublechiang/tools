#!/bin/sh




ip=$1
image=$2
cd linuxflash

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   cd Linux_x86_64
   echo ""
   echo Linux x86_64 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -d 2 -nw -preserve-nvram -ip $ip -u admin -p cmb9.admin ../../$image
else
   cd Linux_x86_32
   echo ""
   echo Linux x86 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -d 2 -nw -preserve-nvram -ip $ip -u admin -p cmb9.admin ../../$image
fi

cd ../.. 