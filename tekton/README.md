# Tekton for Civo's Kubernetes Marketplace

Tekton is a Kubernetes native CI/CD pipeline.  See [manifest.yaml](manifest.yaml) for more details.

## Updating the application

Pull the pinned version of the installation yamls and assemble them into a unified `app.yaml`

```sh
make clean
make build
```

## Test the application

Requires that you the [the civo cli utility installed](https://github.com/civo/cli) and authentication setup correctly.  This will build out a small k3s cluster, deploy Tekton, then run a small job to verify the pipeline works as expected.  The cluster will be torn down upon successful completion.  If the build fails, the cluster will remain to assist in debugging the test failure.

```sh
make test
```
