#!/bin/sh

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   chmod 777 socflash_x64
   ./socflash_x64 $@
else
   chmod 777 socflash
   ./socflash $@
fi

