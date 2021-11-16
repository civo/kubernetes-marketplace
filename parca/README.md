# Parca

Continuous profiling for analysis of CPU, memory usage over time, and down to the line number. Saving infrastructure cost, improving performance, and increasing reliability.

## Updating the application

As part of every Parca release there is a [kubernetes-manifest.yaml](https://github.com/parca-dev/parca/releases/download/v0.4.1/kubernetes-manifest.yaml) that is stored as parca.yaml. Then for the agent the same [kubernetes-manifest.yaml](https://github.com/parca-dev/parca-agent/releases/download/v0.2.0/kubernetes-manifest.yaml) is available stoerd as parca-agent.yaml.
To combine both we run
```
cat parca.yaml > app.yaml
cat parca-agent.yaml >> app.yaml
```

## Test the application

Download a kubeconfig from Civo cloud and apply the app.yaml like so:

```
kubectl apply -f parca/app.yaml
```
