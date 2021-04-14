#!/bin/bash

curl -sL https://run.linkerd.io/install | sh

export PATH=$PATH:$HOME/.linkerd2/bin

linkerd check && linkerd jaeger install | kubectl apply -f -
linkerd check || exit 1
