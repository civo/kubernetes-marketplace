#!/bin/bash

curl -sL https://run.linkerd.io/install-edge | sh
export PATH=$PATH:$HOME/.linkerd2/bin

# Validate that Linkerd can be installed
linkerd check --pre || exit 1

# Install Linkerd CRDs first (required since Linkerd v2.12+)
linkerd install --crds | kubectl apply -f -

# Install the Linkerd control plane
linkerd install | kubectl apply -f -

case ${LINKERD} in
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
