#!/bin/bash

set -e

# Delete Flux CRDs, controllers and custom resources
flux uninstall --silent --keep-namespace

# Delete flux-system namespace (blocks until finalizers are reconciled)
kubectl delete namespace flux-system
