#!/bin/bash

curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

case $LINKERD in
  linkerdjaeger)  
    linkerd jaeger uninstall | kubectl delete -f -
    ;;
  linkerdviz)
    linkerd viz uninstall | kubectl delete -f -
    ;;
  theworks)
    linkerd viz uninstall | kubectl delete -f -
    linkerd jaeger uninstall | kubectl delete -f -
    ;;
esac

linkerd uninstall | kubectl delete -f -
