#!/bin/bash

helm uninstall rqlite --namespace rqlite
kubectl delete ns rqlite
