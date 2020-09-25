## Using Kubei

### Usage instruction

Verify Kubei is up and running.
```
$ kubectl -n kubei get pod -lapp=kubei
NAME                     READY   STATUS    RESTARTS   AGE
kubei-5f7564c946-8rsvj   1/1     Running   0          4m
```

We use `kubectl port-forward` to expose Kubei UI.
```
$ kubectl -n kubei port-forward $(kubectl -n kubei get pods -lapp=kubei -o jsonpath='{.items[0].metadata.name}') 8080
```
Now access the Kubei UI at `http://localhost:8080/view` and then click `GO` to run a scan.

To check the state of Kubei, and the progress of ongoing scans, run the following command:
```
$ kubectl -n kubei logs $(kubectl -n kubei get pods -lapp=kubei -o jsonpath='{.items[0].metadata.name}')
```

Refresh the page `http://localhost:8080/view` to see the updated results.

To know more, check the [official guide](https://github.com/Portshift/Kubei).
