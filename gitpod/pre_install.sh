#!/bin/sh

set -e

# Set add the Gitpod labels to all nodes
# This is arguably not the most efficient approach, but we don't know the number of nodes
# @link https://github.com/gitpod-io/gitpod/blob/bf46392c102a2caed91f86916cfb2f24c48ee2ca/installer/pkg/cluster/affinity.go#L8
kubectl label nodes --all gitpod.io/workload_meta=true || true
kubectl label nodes --all gitpod.io/workload_ide=true || true
kubectl label nodes --all gitpod.io/workload_workspace_services=true || true
kubectl label nodes --all gitpod.io/workload_workspace_regular=true || true
kubectl label nodes --all gitpod.io/workload_workspace_headless=true || true
