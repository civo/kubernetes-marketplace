# Prometheus-Operator

The [prometheus-operator](https://github.com/coreos/prometheus-operator) 
creates/configures/manages Prometheus clusters atop Kubernetes.

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


For further details on this specific installation please see the [Helm chart](https://github.com/helm/charts/tree/master/stable/prometheus-operator).

## Configuration

Visit [prometheus-operator](https://github.com/coreos/prometheus-operator) to learn how to configure Prometheus & Alertmanager.
