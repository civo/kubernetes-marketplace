## Post Install

- Port forward to the grafana pod
```sh
kubectl port-forward -n monitoring service/prometheus-operator-grafana 8080:80
```
- Log into the grafana stack 
  - URL: http://localhost:8080 
  - credentials: admin/prom-operator
- Go to "Configuration" (gear icon along left hand side), then "Data Sources"
- Click "Add Data Source"
- Select Loki
- Set URL to `http://loki.loki.svc.cluster.local:3100`
- Save and Test Source
- Grafana's "Explorer" functionality can be used to get a quick view of collected logs.
