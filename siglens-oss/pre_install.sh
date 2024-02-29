kubectl create configmap siglens-config --from-file=server.yaml
kubectl create configmap ssmetrics-otel-collector-config --from-file=ssmetrics-otel-collector-config.yaml=ssmetrics-otel-collector-config.yaml

echo "Config-Maps created..."