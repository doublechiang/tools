#!/bin/bash
# Under MAC OS, mount sshfs of remote server
if [ $# -ne 2 ]; then
    echo "Usage: $0 [xxx@ip] [local_mnt_point]"; exit 1;
fi
user_remote=$1
mnt_point=$2
sudo sshfs -o allow_other $user_remote: $mnt_point
