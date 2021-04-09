#!/bin/bash

curl -sL https://run.linkerd.io/install | sh

export PATH=$PATH:$HOME/.linkerd2/bin

linkerd uninstall | kubectl delete -f -
