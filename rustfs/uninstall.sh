#!/bin/bash
set -euo pipefail

helm uninstall rustfs --namespace rustfs
kubectl delete namespace rustfs
