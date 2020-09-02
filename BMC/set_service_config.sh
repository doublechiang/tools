#!/usr/bin/env bash

output=`ipmitool -H 10.16.1.149 -U root -P root raw 0x32 0x69 1 0 0 0`
echo ${output}
