#! /bin/bash
# Setup and un-Setup Quanta Proxy environment.
function install() {
    git config --global http.proxy http://proxy.quanta.corp:80
    git config --global https.proxy https://proxy.quanta.corp:80
    echo "Git proxy set to Quantao Proxy"
}

function uninstall() {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
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


