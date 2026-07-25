## Temporal

Temporal is a scalable and reliable runtime for durable function executions called [Temporal Workflow Executions](https://docs.temporal.io/workflow-execution). It is a platform that guarantees the [Durable Execution](https://docs.temporal.io/temporal#durable-execution) of your application code, making it fault-tolerant by design.

### Get started

To access the **Temporal Web UI**, run the following command to port-forward the service:

```bash
kubectl port-forward services/temporal-web 8080:8080 -n temporal
```

Then open your browser at [http://localhost:8080](http://localhost:8080).

### Access the Temporal Frontend (gRPC)

Your Temporal SDKs connect to the frontend service. Port-forward it locally:

```bash
kubectl port-forward services/temporal-frontend 7233:7233 -n temporal
```

Connect your Temporal SDK or `tctl` CLI to `localhost:7233`.

### Install the Temporal CLI (tctl)

```bash
# macOS
brew install temporal

# Linux / other
curl -sSf https://temporal.download/cli.sh | sh
```

Then connect to your cluster:

```bash
temporal workflow list --address localhost:7233
```

### Documentation & Resources

- [Temporal Documentation](https://docs.temporal.io/)
- [Temporal Helm Charts](https://github.com/temporalio/helm-charts)
- [Temporal SDKs](https://docs.temporal.io/dev-guide/) (Go, Java, Python, TypeScript, .NET, PHP)
- [Sample Applications](https://github.com/temporalio/samples-go)
- [Temporal Community](https://community.temporal.io/)

### Notes

- This installation uses Cassandra as the default persistence backend and includes the Temporal Web UI.
- For production workloads, it is strongly recommended to configure an **external database** (PostgreSQL or MySQL) and review the [production deployment checklist](https://docs.temporal.io/self-hosted-guide/production-checklist).
- Advanced configuration is available via `helm upgrade temporal temporal/temporal -n temporal -f your-values.yaml`.
