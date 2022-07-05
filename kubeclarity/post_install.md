## Using Kubeclarity

### Usage instruction

Verify Kubeclarity is up and running.
```
$ kubectl -n kubeclarity get pod
NAME                                                   READY   STATUS    RESTARTS   AGE
kubeclarity-kubeclarity-sbom-db-6648b5dfb7-5rjvq       1/1     Running   0          5m
kubeclarity-kubeclarity-grype-server-7784fdc5b-wf5pt   1/1     Running   0          5m
kubeclarity-kubeclarity-postgresql-0                   1/1     Running   0          5m
kubeclarity-kubeclarity-56985c4497-6lhkm               1/1     Running   0          5m
```

We use `kubectl port-forward` to expose Kubeclarity UI.
```
$ kubectl port-forward --namespace kubeclarity svc/kubeclarity-kubeclarity 9999:8080
```
Now access the Kubeclarity UI at `http://localhost:9999/` and then select the runtime scan tab on the left, click on start scan after selecting the namespaces you want to scan.

To know more, check the [official guide](https://github.com/cisco-open/kubei).
