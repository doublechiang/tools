#!/bin/bash
# Under MAC OS, mount sshfs of remote server
# to jump, -o ssh_command="ssh -J [jump_host]"


usage() {
    echo "Usage: $0 <-J jump> [xxx@ip] [local_mnt_point]"
}


while getopts "J:" flag; do
    case $flag in
        J)         
        jumphost=$OPTARG
        ;;
    esac
done

user_remote=${@:$OPTIND:1}
mnt_point=${@:$OPTIND+1:1}

if [[ ! -z $user_remote && ! -z $mnt_point ]]; then

    if [ ${jumphost+x} ]; then
        sudo sshfs -o allow_other -o ssh_command="ssh -J $jumphost" $user_remote $mnt_point
    else
        sudo sshfs -o allow_other $user_remote $mnt_point
    fi
else
    usage
    exit 1
fi
