#!/bin/bash
# Author: JiangJunYu
# This script check the the docker images is exist or not, if not, create one.
# Privilige: require sudo privilige

#
function docker_env() {
  pwd=`pwd`
  # Using docker file to build your container
  docker build -t debian/jessie .
  docker run  -v $pwd:/home:rw -it debian/jessie /bin/bash
}

function build() {
  pwd=`pwd`
  # Using docker file to build your container
  docker build -t debian/jessie .
  docker run  -v $pwd:/home:rw -it debian/jessie ./build.sh
}


### build a debian working environment
# mount all of the user folder to home folder
function build_debian() {
  docker build -t debian/jessie -f Dockerfile.debian .
  docker run --rm -v $HOME:/home/${USER}:rw -e USER=${USER} -w /home/${USER} -it debian/jessie /bin/bash
}

# In Quanta, default usuable is proxy.quanta.corp
# For linux usage, it require to use 10.243.17.220
function add_proxy() {
  echo -n "Enter your Quanta proxy setting, default is '10.243.17.220', hit [ENTER]:"
  read proxy
  if [ -z ${proxy} ]; then
    proxy="10.243.17.220"
  fi
  echo -n "Enter Your username, for example 10403016, then press [ENTER]:"
  read username
  echo -n "Enter Your password, then press [ENTER]:"
  read password
  http_proxy_setting=http://${username}:${password}@${proxy}:80
  https_proxy_setting=https://${username}:${password}@${proxy}:80
  echo "Writing proxy server setting $http_proxy_setting and $https_proxy_setting to Dockerfile."
  # sed -i.bak '/### proxy setting/a ENV http_proxy ${http_proxy_setting}\n ENV https_proxy ${https_proxy_setting}' Dockerfile
  sed -i.bak -e "/### proxy setting/a \\
ENV http_proxy ${http_proxy_setting}\\
ENV https_proxy ${https_proxy_setting}" Dockerfile
}


function remove_proxy() {
  sed -i.bak -e '/http_proxy/d' -e '/https_proxy/d' Dockerfile
}

case $1 in
  proxy)
  remove_proxy
  add_proxy
  ;;
  noproxy)
  remove_proxy
  ;;
  debian)
  build_debian
  ;;
  *)
  echo "Usage: $0 {proxy|noproxy|debian}"
  exit 1
  ;;
esac
