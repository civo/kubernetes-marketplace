## Redis - in-memory DB and cache

### External access

By default external access to the Redis port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f redis-service.yaml` (or whatever you call the file containing the contents below) which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge):

```
apiVersion: v1
kind: Service
metadata:
  name: redis
spec:
  type: LoadBalancer
  ports:
    - port: 6379
      targetPort: 6379
      protocol: TCP
  selector:
    app: redis
```

This will open up http://YOUR_CLUSTER_ID.k8s.civo.com:6379 to the whole world. You should lock this down in the [firewall](https://dashboard.civo.com/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instructions

You can use this application from within your cluster by just using the hostname `redis` and the password above this message. For example, to connect to Redis inside your cluster to test it or look at its data, you could do something like this:

```
$ kubectl run tmp-shell --generator=run-pod/v1 --rm -i --tty \
  --image alpine -- /bin/sh
/ # apk update
/ # apk add redis
/ # redis-cli -h redis -a YOUR_PASSWORD_HERE
redis:6379>
```

When you quit the shell the pod for this temporary Alpine container will be deleted.
