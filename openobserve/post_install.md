## OpenObserve

OpenObserve (O2 for short) is a cloud-native observability platform built specifically for logs, metrics, traces, analytics, RUM (Real User Monitoring - Performance, Errors, Session Replay) designed to work at petabyte scale.

It is straightforward and easy to operate, in contrast to Elasticsearch, which requires understanding and tuning numerous settings. Get OpenObserve up and running in under 2 minutes.

OpenObserve serves as a seamless replacement for Elasticsearch for users who ingest data using APIs and perform searches. OpenObserve comes with its own user interface, eliminating the need for separate installation.

You can reduce your log storage costs by ~140x compared to Elasticsearch by using OpenObserve. Below, we present the results from pushing logs from our production Kubernetes cluster to both Elasticsearch and OpenObserve using Fluent Bit.

### Get started

Create a namespace:

```shell
kubectl create ns openobserve
```

Create the deployment:

```shell
kubectl apply -f https://raw.githubusercontent.com/zinclabs/openobserve/main/deploy/k8s/statefulset.yaml
```

Expose the openobserve service by port-forwarding:

```shell
kubectl -n openobserve port-forward svc/openobserve 5080:5080
```

Now point your browser to http://localhost:5080 and login

