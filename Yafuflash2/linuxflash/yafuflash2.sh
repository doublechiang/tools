#!/bin/sh

#check RHEL OS
if [ -f /etc/redhat-release ]; then
	modprobe sg
fi

#check architecture
CMD=`uname -m | cut -c 1-6`
if [ "$CMD" = "x86_64" ]; then
   cd Linux_x86_64
   echo ""
   echo Linux x86_64 Environment

   chmod 777 Yafuflash2
   ./Yafuflash2 $@
else
   cd Linux_x86_32
   echo ""
   echo Linux x86 Environment
   chmod 777 Yafuflash2
   ./Yafuflash2 $@  
fi

