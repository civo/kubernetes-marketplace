## Using Longhorn persistent volumes

### Installation note:

Longhorn requires a minimum of 3 nodes to function, if you attempt to install Longhorn on cluster smaller than this, it will not function properly. If you have installed Longhorn on a cluster that is too small, you will encounter errors from Longhorn, but you can simply scale the cluster up to a 3 node minimum and the issue will resolve itself automatically. 

### External access

By default external access to the Longhorn dashboard isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f longhorn-service.yaml` (or whatever you call the file containing the contents below):


```
kind: Service
apiVersion: v1
metadata:
  labels:
    app: longhorn-ui
  name: longhorn-frontend
  namespace: longhorn-system
spec:
  selector:
    app: longhorn-ui
  ports:
  - port: 8000
    targetPort: 8000
  type: LoadBalancer
```

This will open up http://YOUR_CLUSTER_ID.k8s.civo.com:8000/dashboard to the whole world. You should lock this down in the [firewall](https://www.civo.com/account/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instructions

Create a persistent volume in a file called something like `pv.yaml` with:

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mysql-pv
  namespace: apps
  labels:
    name: mysql-data
    type: longhorn
spec:
  capacity:
    storage: 5G
  volumeMode: Filesystem
  storageClassName: longhorn
  accessModes:
    - ReadWriteOnce
  csi:
    driver: io.rancher.longhorn
    fsType: ext4
    volumeAttributes:
      numberOfReplicates: '2'
      staleReplicaTimeout: '20'
    volumeHandle: mysql-data
```

And create a claim to that volume (like an abstract request so that something can use the volume) in something like `pv-claim.yaml`:

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mysql-pv-claim
  labels:
    type: longhorn
    app: example
spec:
  storageClassName: longhorn
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 5Gi
```
