#!/bin/bash
# Under MAC OS, mount sshfs of remote server
usage() {
    echo "Usage: $0 [-J jump] <source> <destination>"; exit 1;
}

while getopts "J:" flag; do
    case "$flag" in
        J) jumphost=$OPTARG;;
    esac
done

source=${@:$OPTIND:1}
dest=${@:$OPTIND+1:1}

scp -o ProxyCommand="ssh -W %h:%p ${jumphost}" $source $dest
