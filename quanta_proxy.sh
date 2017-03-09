#! /bin/bash
# Setup and un-Setup Proxy environment.
# use source command to read this file and execute it in the current shell
PROXY_SERVER=10.243.17.220:80
function install() {
    git config --global http.proxy http://$PROXY_SERVER
    git config --global https.proxy https://$PROXY_SERVER
    export http_proxy=http://$PROXY_SERVER
    export https_proxy=https://$PROXY_SERVER
    echo "Git proxy set to Quantao Proxy $PROXY_SERVER"
}

function uninstall() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    unset http_proxy
    unset https_proxy
    echo "Git porxy unset"
}


function usages() {
    echo "use $0 \"install | uninstall\" to setup the environment"
}


case $1 in
    "install")
	install
    ;;

    "uninstall")
	uninstall
    ;;
    *)
    usages
    exit 1;
esac
