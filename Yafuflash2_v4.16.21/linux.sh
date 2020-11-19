#!/bin/sh
echo ""
echo BMC firmware image: $filename

filename=$1

pd=`dirname $0`
plat=`uname -m | cut -c 1-6`
arch='Linux_x86_32'
if [ "$plat" = "x86_64" ]; then
	arch='Linux_x86_64'
fi

$pd/linuxflash/$arch/Yafuflash2 -vyes -cd -fb $filename

