## kubefirst

Kubefirst delivers instant GitOps platforms so you can have the most popular open source platform tools working together in minutes.

### Access your console

```shell
civo kubernetes config $CIVO:CLUSTER_NAME --save

kubectl --namespace kubefirst port-forward svc/kubefirst-console 8080:8080
```

visit [http://localhost:8080](http://localhost:8080)

Learn more about your self-hosted platform at [docs.kubefirst.io](https://docs.kubefirst.io/civo/overview/).
