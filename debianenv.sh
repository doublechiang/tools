#!/bin/bash
# Author: JiangJunYu
# Debian develoopment environment

# Mount home directory into the contianer
function run() {
  pwd=`pwd`
  docker run  -v ${HOME}:/home:rw -i -t debianenv /bin/bash
}

# Pipe docker through stdin
function build() {
  pwd=`pwd`
  # Using docker file to build your container
  docker build -t debianenv -<<EOF
FROM debian:jessie
MAINTAINER jiangjunyu
RUN apt-get update
RUN apt-get install -y build-essential vim pv man kpartx
WORKDIR /home
EOF
}


case $1 in
  build)
  build
  ;;
  run)
  run
  ;;
  *)
  echo "Usage: $0 {build|run}"
  exit 1
  ;;
esac
