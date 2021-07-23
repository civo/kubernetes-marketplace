# Running Jaeger

Once the operator has been installed and deployed, you can start a Jaeger instance by modifying the below snippet for your needs, saving it as _jaeger.yaml_ and running `kubectl apply -f jaeger.yaml`:

```yaml
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: simplest
  namespace: jaeger
```

You will then be able to access the Jaeger UI using the IP address of your cluster. This should be displayed when you run `kubectl get -n jaeger ingress`:

```sh
$ kubectl get -n jaeger ingress
NAME             CLASS    HOSTS   ADDRESS          PORTS   AGE
simplest-query   <none>   *       <ip-address>      80      2m
```
