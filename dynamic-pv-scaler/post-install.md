## Description

Dynamic PV Scaler is a Kubernetes application developed using Golang to address the challenge of scaling Persistent Volume (PV) in Kubernetes. This tool is designed to scale the PV based on a set threshold, which helps to overcome the scaling issue that organizations typically face. 


With Dynamic PV Scaler, Kubernetes users can easily adjust PV scaling based on their specific needs without worrying about manual intervention or complicated configurations. This feature provides greater flexibility and efficiency to Kubernetes users, enabling them to optimize their storage resources and improve overall application performance.

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

## Support

If you require additional support, head to Opstree’s [GitHub page](https://github.com/opstree/dynamic-pv-scaler). 
