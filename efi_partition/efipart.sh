#!/bin/bash
# Author: Chunyu Chiang

IMG=./efihd.img

# check required package.
command -v parted > /dev/null 2>&1 || { echo >&2 "parted required"; exit 1; }
command -v kpartx > /dev/null 2>&1 || { echo >&2 "kpartx required"; exit 1; } 
command -v mkfs.fat > /dev/null 2>&1 || { echo >&2 "dosfstools required"; exit 1; } 

# Create a fixed size image file for efi hdd partition
dd if=/dev/zero of=${IMG} count=100 bs=1M

# create ESP, bootable partition
parted --script ${IMG} \
  mklabel msdos \
  mkpart primary fat32 1 100M \
  set 1 boot on \
  set 1 esp on 


# format the partition with fat32, check loop device created.
loopdev=`kpartx -av ${IMG} | cut -d " " -f 3` 
sync
sleep 1
mkfs.fat -F 32 /dev/mapper/${loopdev}
mkdir -p /tmp/efipart
mount /dev/mapper/${loopdev} /tmp/efipart
mkdir -p /tmp/efipart/efi/boot
cp Shell.efi /tmp/efipart/efi/boot/bootx64.efi
cp startup.nsh /tmp/efipart/
umount /tmp/efipart
kpartx -d ${IMG}




