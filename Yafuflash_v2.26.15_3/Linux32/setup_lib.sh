#!/bin/bash
#=====================================================================
#Yafuflash linux SOP
#=====================================================================
#1. Copy libipmi.so.1.0 to /usr/lib and /usr/local/lib

cp ./libipmi.so.1.0 /usr/lib/
cp ./libipmi.so.1.0 /usr/local/lib/

#2. Then need to create softlinks and update the shared libraries cache.

ln -sf /usr/lib/libipmi.so.1.0 /usr/lib/libipmi.so
ln -sf /usr/lib/libipmi.so.1.0 /usr/lib/libipmi.so.1
ldconfig

ln -sf /usr/local/lib/libpimi.so.1.0 /usr/lib/libipmi.so
ln -sf /usr/local/lib/libpimi.so.1.0 /usr/lib/libipmi.so.1
ldconfig

#3. Now try to execute Yafuflash by command line.
