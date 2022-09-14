## Verify Volcano deployment

After installation, it will take some time for all Pods to become ready. You should make sure all Pods are ready, to check that all Volcano-related Pods are ready, run the following commands:

```sh
kubectl get all -n volcano-system
```

You are now all set to use Volcano, feel free to get started with [this tutorial](https://volcano.sh/en/docs/tutorials/).