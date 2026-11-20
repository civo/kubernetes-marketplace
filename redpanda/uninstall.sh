#!/bin/bash
set -euo pipefail

helm uninstall redpanda --namespace redpanda
kubectl delete namespace redpanda
