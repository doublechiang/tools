#!/bin/bash

usage() {
cat <<EOF
Usage:
$1 [file], the file you want to convert.
EOF
}

if [ "$1" == "" ]; then
    usage $0
    exit 1
fi

tmpf=`mktemp`

cat $1 | sed -u -b -e s/"\x00\x00\x45\x00"/"\x08\x00\x45\x00"/g -e s/"\x00\x00\x45\xC0"/"\x08\x00\x45\xC0"/g -e s/"\x00\x00\x45\xb8"/"\x08\x00\x45\xb8"/g -e s/"\x00\x00\x45\xe0"/"\x08\x00\x45\xe0"/g -e s/"\x00\x00\x45\xc2"/"\x08\x00\x45\xc2"/g > ${tmpf}
mv ${tmpf} $1

