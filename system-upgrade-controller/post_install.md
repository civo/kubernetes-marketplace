## system-upgrade-contoller - a general-purpose, Kubernetes-native upgrade controller (for nodes)

### Get started

Documentation for [system-upgrade-controller](https://github.com/rancher/system-upgrade-controller)

Some [example-plans](https://github.com/rancher/system-upgrade-controller#example-plans)

A plan is need to start upgrade process on cluster. This is easliy by applying the following yaml manifests to your cluster with
`kubectl apply -f civo-plan.yaml (or whatenver you call the file containing the contents below)

```
# Server plan
apiVersion: upgrade.cattle.io/v1
kind: Plan
metadata:
  name: server-plan
  namespace: system-upgrade
spec:
  concurrency: 1
  cordon: true
  nodeSelector:
    matchExpressions:
    - key: node-role.kubernetes.io/master
      operator: In
      values:
      - "true"
  serviceAccountName: system-upgrade
  upgrade:
    image: rancher/k3s-upgrade
  channel: https://update.k3s.io/v1-release/channels/v1.16
---
# Agent plan
apiVersion: upgrade.cattle.io/v1
kind: Plan
metadata:
  name: agent-plan
  namespace: system-upgrade
spec:
  concurrency: 1
  cordon: true
  nodeSelector:
    matchExpressions:
    - key: node-role.kubernetes.io/master
      operator: DoesNotExist
  prepare:
    args:
    - prepare
    - server-plan
    image: rancher/k3s-upgrade:v1.17.4-k3s1
  serviceAccountName: system-upgrade
  upgrade:
    image: rancher/k3s-upgrade
  channel: https://update.k3s.io/v1-release/channels/v1.16
```

This will create the plan for the system-update-controller and on the Civo kubernetes nodes the k3s version will be updated to the last (stable) version.

Check it via `kubectl get nodes --output wide`