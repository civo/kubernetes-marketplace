#!/bin/bash

# Delete the GreptimeDB
helm uninstall greptimedb-standalone -n greptimedb

# Delete the namespace
kubectl delete namespace greptimedb
