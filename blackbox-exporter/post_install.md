# Prometheus-Blackbox-Exporter

The [Prometheus-Blackbox-Exporter](https://github.com/prometheus/blackbox_exporter) installs Prometheus-Blackbox-Exporter  to monitor endpoints and services in  your kubernetes cluster.

## Details

The Prometheus-Blackbox-Exporter is installed in the `monitoring` namespace, to check the pods/services installed use:

```sh
kubectl get pods -n monitoring
kubectl get services -n monitoring
```

For further details on this specific installation please see the [Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/prometheus-blackbox-exporter).

## Prometheus Configuration

Blackbox exporter implements the multi-target exporter pattern, so we advice
to read the guide [Understanding and using the multi-target exporter pattern
](https://prometheus.io/docs/guides/multi-target-exporter/) to get the general
idea about the configuration.

The blackbox exporter needs to be passed the target as a parameter, this can be
done with relabelling.

Example config:
```yml
scrape_configs:
  - job_name: 'blackbox'
    metrics_path: /probe
    params:
      module: [http_2xx]  # Look for a HTTP 200 response.
    static_configs:
      - targets:
        - http://prometheus.io    # Target to probe with http.
        - https://prometheus.io   # Target to probe with https.
        - http://example.com:8080 # Target to probe with http on port 8080.
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: 127.0.0.1:9115  # The blackbox exporter's real hostname:port.
```

HTTP probes can accept an additional `hostname` parameter that will set `Host` header and TLS SNI. This can be especially useful with `dns_sd_config`:
```yaml
scrape_configs:
  - job_name: blackbox_all
    metrics_path: /probe
    params:
      module: [ http_2xx ]  # Look for a HTTP 200 response.
    dns_sd_configs:
      - names:
          - example.com
          - prometheus.io
        type: A
        port: 443
    relabel_configs:
      - source_labels: [__address__]
        target_label: __param_target
        replacement: https://$1/  # Make probe URL be like https://1.2.3.4:443/
      - source_labels: [__param_target]
        target_label: instance
      - target_label: __address__
        replacement: 127.0.0.1:9115  # The blackbox exporter's real hostname:port.
      - source_labels: [__meta_dns_name]
        target_label: __param_hostname  # Make domain name become 'Host' header for probe requests
      - source_labels: [__meta_dns_name]
        target_label: vhost  # and store it in 'vhost' label
```


## Configuration


Visit the [prometheus-operator website](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) to learn how to configure Prometheus & blackbox exporter.
