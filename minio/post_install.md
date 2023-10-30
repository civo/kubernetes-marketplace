## Using MinIO for S3 compatible object storage

### External access

By default external access to the MinIO UI isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f minio-service.yaml` (or whatever you call the file containing the contents below) which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge):

```
apiVersion: v1
kind: Service
metadata:
  name: minio-service
spec:
  type: LoadBalancer
  ports:
    - port: 9000
      targetPort: 9000
      protocol: TCP
  selector:
    app: minio
```

This will open up http://YOUR_CLUSTER_ID.k8s.civo.com:9000 to the whole world. You should lock this down in the [firewall](https://dashboard.civo.com/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

We'd recommend installing [mc](https://github.com/minio/mc) the MinIO client for your operating system, to allow easy file operations from the command line.

Other than that, your access key and secret key should be above this message and you can use those to configure your application to access MinIO just as you would with S3. For example, Ruby on Rails ActiveStorage is configured with something like:

```
minio:
  service: S3
  access_key_id: YOUR_ACCESS_KEY_HERE
  secret_access_key: YOUR_SECRET_KEY_HERE
  region: us-east-1
  bucket: your_own_bucket
  endpoint: "http://YOUR_CLUSTER_ID.k8s.civo.com:9000"
  force_path_style: true
```

We would also recommend installing TLS certificates and using the pre-installed Traefik as an Ingress controller.
