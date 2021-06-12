# Prometheus-Operator

The [prometheus-operator](https://prometheus-operator.dev/) installs prometheus, alertmanager, grafana and other tools to monitor your kubernetes cluster.

## Details

The prometheus-operator stack is installed in the `monitoring` namespace, to check the pods/services installed use:

```sh
kubectl get pods -n monitoring
kubectl get services -n monitoring
```

The installed services are:

* prometheus-operator
* prometheus
* alertmanager
* node-exporter
* kube-state-metrics
* grafana

Service monitors to scrape internal kubernetes components:

* kube-apiserver
* kube-scheduler
* kube-controller-manager
* etcd
* kube-dns/coredns
* kube-proxy

For further details on this specific installation please see the [Helm chart](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack).

## Configuration

Visit the [prometheus-operator website](https://prometheus-operator.dev/) to learn how to configure Prometheus & Alertmanager.
