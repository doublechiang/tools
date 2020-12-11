#!/bin/sh
filename=`cat rom_enc.txt`
echo ""
echo BMC firmware image: $filename

ip=$1
pwd=$2

cd linuxflash

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   cd Linux_x86_64
   echo ""
   echo Linux x86_64 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -vyes -nw -ip $ip -u admin -p $pwd -fb -pipmi -pauth -pnet -psnmp -pssh -pkvm -pntp -psel ../../$filename
else
   cd Linux_x86_32
   echo ""
   echo Linux x86 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 -vyes -nw -ip $ip -u admin -p $pwd -fb -pipmi -pauth -pnet -psnmp -pssh -pkvm -pntp -psel ../../$filename
fi
 
cd ../.. 
