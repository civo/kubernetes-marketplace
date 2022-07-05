# Prometheus-Blackbox-Exporter

The [Prometheus-Blackbox-Exporter](https://github.com/prometheus/blackbox_exporter) installs Prometheus-Blackbox-Exporter  to monitor endpoints and services in  your kubernetes cluster.

## Details

The Prometheus-Blackbox-Exporter is installed in the `monitoring` namespace, to check the pods/services installed use:

```sh
kubectl get pods -n monitoring
kubectl get services -n monitoring
```
For further details on this specific installation  and configuration please see the [Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-blackbox-exporter).
