## Dynamic PV Scaler

### Enabling to monitor namespaces and persistent volumes

By default dynamic-pv-scaler will not monitor and resize any of the persistent volumes, for that, we have to create a configmap with the target namespace and pvc content.

An example could be like this:-

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: dynamic-pv-scaler-config
  labels:
    name: dynamic-pv-scaler-config
    app: dynamic-pv-scaler-config
data:
  config.yaml: |-
    ---
    - namespace: default
      scale_percentage: 50
      threshold_percentage: 80
      pvc_name: data-mysql-0
```
