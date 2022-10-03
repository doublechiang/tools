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

if [[ ! -z $source && ! -z $dest ]]; then
    scp -o ProxyCommand="ssh -W %h:%p ${jumphost}" $source $dest
else
    usage
    exit 1
fi



