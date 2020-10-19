# Loki (Loki-Stack)

Loki is Prometheus, but for logs.  See [manifest.yaml](manifest.yaml) for more details.

## Updating the application

Pull the pinned version of the installation yamls and assemble them into a unified `app.yaml`

```sh
make latest_version  #Print Latest version form helm chart
make clean
make build
```

## Test the application

Requires that you the [the civo cli utility installed](https://github.com/civo/cli) and authentication setup correctly.  This will build out a small k3s cluster, deploy the app, then run any tests that are defined.  The cluster will be torn down upon successful completion.  If the build fails, the cluster will remain to assist in debugging the test failure.

```sh
make test # Will automatically remove cluster after success
make test-keep  # Will test, but keep the cluster with app and tests running
```


