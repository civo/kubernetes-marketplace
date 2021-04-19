#!/bin/bash

curl -sL https://run.linkerd.io/install | sh
export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check --pre && linkerd install | kubectl apply -f -
case $LINKERD in
  linkerd)
    linkerd check || exit 1
    ;;
  linkerdjaeger)  
    linkerd check || exit 1
    linkerd jaeger install | kubectl apply -f -
    linkerd check || exit 1
    ;;
  linkerdviz)
    linkerd check || exit 1
    linkerd viz install | kubectl apply -f -
    linkerd check || exit 1
    ;;
  theworks)
    linkerd check || exit 1
    linkerd viz install | kubectl apply -f -
    linkerd check || exit 1
    linkerd jaeger install | kubectl apply -f -
    linkerd check || exit 1
    ;;
esac
