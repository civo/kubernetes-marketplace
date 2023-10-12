## MongoDB

### External access

By default external access to the MongoDB port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f mongodb-service.yaml` (or whatever you call the file containing the contents below) which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge):

```
apiVersion: v1
kind: Service
metadata:
  name: mongodb-service
spec:
  type: LoadBalancer
  ports:
    - port: 27017
      targetPort: 27017
      protocol: TCP
  selector:
    app: mongodb
```

This will open up YOUR_CLUSTER_ID.k8s.civo.com:27017 to the whole world. You should lock this down in the [firewall](https://dashboard.civo.com/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

You can use this application from within your cluster by just using the hostname `mongodb` and can create databases and users using the `root` access credentials above this message. For example, to create an application's database and user credentials and given that the `kubectx` and [Civo CLI](https://www.civo.com/docs/overview/civo-cli) are installed, with a Civo Kubernetes cluster called `my-cluster-name`:

```
$ civo k3s config my-cluster-name --save
$ kubectx my-cluster-name
$ kubectl run tmp-shell --generator=run-pod/v1 --rm -i \
  --tty --image alpine:3.9 -- /bin/sh

/ # apk update
/ # apk add mongodb
/ # mongo mongodb://root:password@mongodb:27017/test?authSource=admin

> use people
switched to db people
> db.collection1.insert({"name": "ruan", "surname": "bekker"})
WriteResult({ "nInserted" : 1 })
> db.collection1.find().pretty()
{
	"_id" : ObjectId("5d9dc2bd8d1d65fd1e25f41b"),
	"name" : "ruan",
	"surname" : "bekker"
}
```
