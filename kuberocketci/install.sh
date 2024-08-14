#!/bin/bash

domain="${CLUSTER_ID}.k8s.civo.com"
gitProvider=${GITPROVIDER}

helm repo add epamedp https://epam.github.io/edp-helm-charts/stable
helm repo update

# Wait for Tekton to be ready
kubectl wait --for=condition=available --timeout=200s deployment/tekton-pipelines-webhook -n tekton-pipelines

cat <<EOF | kubectl apply -f -
---
apiVersion: triggers.tekton.dev/v1alpha1
kind: ClusterInterceptor
metadata:
  name: cel
  labels:
    server/type: https
spec:
  clientConfig:
    service:
      name: tekton-triggers-core-interceptors
      namespace: tekton-pipelines
      path: "cel"
      port: 8443
---
apiVersion: triggers.tekton.dev/v1alpha1
kind: ClusterInterceptor
metadata:
  name: github
  labels:
    server/type: https
spec:
  clientConfig:
    service:
      name: tekton-triggers-core-interceptors
      namespace: tekton-pipelines
      path: "github"
      port: 8443
---
apiVersion: triggers.tekton.dev/v1alpha1
kind: ClusterInterceptor
metadata:
  name: gitlab
  labels:
    server/type: https
spec:
  clientConfig:
    service:
      name: tekton-triggers-core-interceptors
      namespace: tekton-pipelines
      path: "gitlab"
      port: 8443
EOF

kubectl create namespace edp

helm install edp epamedp/edp-install --version 3.9.0 --namespace edp --set global.dnsWildCard="$domain" --set 'global.gitProviders[0]'=${GITPROVIDER} --timeout 10m
