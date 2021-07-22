#!/bin/bash

# Delete Chaos Mesh
helm uninstall chaos-mesh -n chaos-testing

# Delete chaos-testing namespace
kubectl delete namespace chaos-testing
