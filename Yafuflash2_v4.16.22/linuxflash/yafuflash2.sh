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
      if [ -d "/sys/module/ipmi_si/parameters" ]; then
        #echo "remove,kcs,i/o,0xca2,rsp=1,rsi=1,rsh=0,irq=0,ipmb=0 " 
        >/sys/module/ipmi_si/parameters/hotmod   
        chmod 777 Yafuflash2
        ./Yafuflash2 $@
        #echo "add,kcs,i/o,0xca2,rsp=1,rsi=1,rsh=0,irq=0,ipmb=0 " 
        >/sys/module/ipmi_si/parameters/hotmod
      else
        chmod 777 Yafuflash2
        ./Yafuflash2 $@
      fi   
else
   cd Linux_x86_32
   echo ""
   echo Linux x86 Environment
      if [ -d "/sys/module/ipmi_si/parameters" ]; then
        #echo "remove,kcs,i/o,0xca2,rsp=1,rsi=1,rsh=0,irq=0,ipmb=0 " 
        >/sys/module/ipmi_si/parameters/hotmod   
        chmod 777 Yafuflash2
        ./Yafuflash2 $@
        #echo "add,kcs,i/o,0xca2,rsp=1,rsi=1,rsh=0,irq=0,ipmb=0 " 
        >/sys/module/ipmi_si/parameters/hotmod
      else
        chmod 777 Yafuflash2
        ./Yafuflash2 $@
      fi   
fi

