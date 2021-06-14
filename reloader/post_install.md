## Reloader

### Problem

We would like to watch if some change happens in `ConfigMap` and/or `Secret`; then perform a rolling upgrade on relevant `DeploymentConfig`, `Deployment`, `Daemonset`, `Statefulset` and `Rollout`

### Solution

Reloader can watch changes in `ConfigMap` and `Secret` and do rolling upgrades on Pods with their associated `DeploymentConfigs`, `Deployments`, `Daemonsets` `Statefulsets` and `Rollouts`.

### How to use Reloader

For a `Deployment` called `foo` have a `ConfigMap` called `foo-configmap` or `Secret` called `foo-secret` or both. Then add your annotation (by default `reloader.stakater.com/auto`) to main metadata of your `Deployment`

```yaml
kind: Deployment
metadata:
  annotations:
    reloader.stakater.com/auto: "true"
spec:
  template: metadata:
```

This will discover deploymentconfigs/deployments/daemonsets/statefulset/rollouts automatically where `foo-configmap` or `foo-secret` is being used either via environment variable or from volume mount. And it will perform rolling upgrade on related pods when `foo-configmap` or `foo-secret`are updated.

### More details

See https://github.com/stakater/Reloader for more details on Reloader
