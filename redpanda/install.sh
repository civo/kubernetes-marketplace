#!/bin/bash
set -euo pipefail

helm repo add redpanda https://charts.redpanda.com
helm repo update

helm upgrade --install redpanda redpanda/redpanda \
  --namespace redpanda \
  --create-namespace \
  --version 26.1.3 \
  --set statefulset.replicas=1 \
  --set tls.enabled=false \
  --set external.enabled=false \
  --set console.enabled=true \
  --set console.service.targetPort=8080 \
  --set storage.persistentVolume.size="${REDPANDA_STORAGE_SIZE}" \
  --set resources.memory.container.max=2.5Gi \
  --set-string resources.cpu.cores=1
