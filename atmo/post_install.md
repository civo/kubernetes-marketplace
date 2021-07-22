## Atmo

Welcome to Atmo, the best way to run cloud native WebAssembly.

To deploy your application once Atmo is running in your cluster, use `subo` and `kubectl`.

First, [build your application bundle](https://atmo.suborbital.dev/usage/building-a-bundle):

```
> subo build .
```

Then, get Atmo's pod name:

```
> kubectl get pods -n suborbital
NAME                               READY   STATUS        RESTARTS   AGE
atmo-deployment-5fc58b5647-f7rlm   1/1     Running       0          10s
```

Finally, upload the bundle (**make sure to use the correct pod name**):

```
> kubectl cp ./runnables.wasm.zip atmo-deployment-5fc58b5647-f7rlm:/home/atmo/ -n suborbital
```

Atmo will check once per second for a bundle file, and start up once one is found. 

## Deploying updates
Deploying updated bundles automatically is not currently supported, as it is a complicated process which requires using `kubectl exec` to delete the bundle file, upload a new bundle, and restart the pod.
