#!/bin/sh
#
# KubeDB Installation
# Process from https://kubedb.com/docs/v0.13.0-rc.0/setup/install/
#
helm repo add appscode https://charts.appscode.com/stable/
helm repo update
helm install appscode/kubedb --name kubedb-op --version v0.12.0
# Wait for kubedb crds to be registered before continuing (16 crds).  Will only check for 30 seconds
checkcount=0
while [ "$(kubectl get crds -l app=kubedb | wc -l)" -lt "16" ] && [ "$checkcount" -lt "6" ]; do
	checkcount=$((checkcount+1))
	sleep 5
done
if [ "$checkcount" -ge "6" ]; then
  >&2 echo "kube-db CRDs not properly registered."
  exit 1
fi
helm install appscode/kubedb-catalog --name kubedb-catalog --version v0.12.0 --namespace default
