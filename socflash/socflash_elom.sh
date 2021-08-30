#!/bin/sh

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   chmod 777 socflash_x64
   ./socflash_x64 $1 $2 0 0 0x400 0x620000
else
   chmod 777 socflash
   ./socflash $1 $2 0 0 0x400 0x620000
fi
