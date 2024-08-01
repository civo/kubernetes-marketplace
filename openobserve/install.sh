#!/bin/bash

kubectl create ns openobserve

kubectl apply -f https://raw.githubusercontent.com/zinclabs/openobserve/main/deploy/k8s/statefulset.yaml
