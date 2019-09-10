#!/bin/bash

for (( i=0; i<30; ++i)); do
    kubectl -n kube-system get pods -o=jsonpath='{.items[?(@.metadata.labels.name=="tiller")].status.conditions[*].status}' | grep -v "False" && break
    sleep 1
done
