## RustFS

RustFS is installed in the `rustfs` namespace.

Access the S3 API inside the cluster at `http://rustfs-svc.rustfs.svc.cluster.local:9000`.

To open the RustFS console locally:

```sh
kubectl port-forward -n rustfs service/rustfs-svc 9001:9001
```

Then open `http://localhost:9001` and log in with the generated access key and secret key.
