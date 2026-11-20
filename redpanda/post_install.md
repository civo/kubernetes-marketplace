## Redpanda

Redpanda is installed in the `redpanda` namespace.

Use the Kafka API inside the cluster at `redpanda.redpanda.svc.cluster.local:9093`.

To open Redpanda Console locally:

```sh
kubectl port-forward -n redpanda service/redpanda-console 8080:8080
```

Then open `http://localhost:8080`.
