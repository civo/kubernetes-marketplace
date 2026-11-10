#!/bin/bash

# Delete the Traefik workload and its cluster-scoped objects.
# The Traefik CRDs are intentionally left in place: deleting a CRD deletes every
# IngressRoute, Middleware, etc. that users created with it.
kubectl delete --ignore-not-found daemonset/traefik serviceaccount/traefik -n kube-system
kubectl delete --ignore-not-found clusterrolebinding/traefik-kube-system clusterrole/traefik-kube-system ingressclass/traefik
