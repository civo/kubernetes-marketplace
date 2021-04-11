#!/bin/bash

# Uninstall
helm --namespace maesh delete maesh

# Delete CRDs
helm pull https://containous.github.io/maesh/charts maesh/maesh
TAR_FILE=$(ls | grep maesh*.tgz)
echo "Chart file:" $TAR_FILE
tar -xvf $TAR_FILE
kubectl delete -f ./maesh/crds
