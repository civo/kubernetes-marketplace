#!/bin/bash
set -euo pipefail

helm repo add rustfs https://charts.rustfs.com
helm repo update

helm upgrade --install rustfs rustfs/rustfs \
  --namespace rustfs \
  --create-namespace \
  --version 0.1.0 \
  --set mode.standalone.enabled=true \
  --set mode.distributed.enabled=false \
  --set ingress.enabled=false \
  --set storageclass.dataStorageSize="${RUSTFS_DATA_SIZE}" \
  --set storageclass.logStorageSize="${RUSTFS_LOG_SIZE}" \
  --set secret.rustfs.access_key="${RUSTFS_ACCESS_KEY}" \
  --set secret.rustfs.secret_key="${RUSTFS_SECRET_KEY}"
