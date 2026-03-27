## OpenEverest - Open Source Database Platform

Thank you for deploying [OpenEverest](https://openeverest.io) to Civo's Kubernetes service.

### Obtain access

By default, OpenEverest is deployed with a `ClusterIP` service, meaning it's only accessible from within the cluster.

#### Option A: Expose via LoadBalancer (Recommended for quick access)

If you selected "Expose Web UI via LoadBalancer" during installation, OpenEverest is already exposed via a Civo LoadBalancer. Retrieve the external IP:

```sh
kubectl get svc everest -n everest-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

Access the UI at: `http://<EXTERNAL-IP>`

#### Option B: Expose via LoadBalancer (manual)

If you didn't enable LoadBalancer during installation, you can expose it later by running:

```sh
helm upgrade everest openeverest/everest \
  --namespace everest-system \
  --reuse-values \
  --set server.service.type=LoadBalancer
```

Then get the external IP:

```sh
kubectl get svc everest -n everest-system -o jsonpath='{.status.loadBalancer.ingress[0].ip}'
```

**Note:** This will expose your OpenEverest UI to the internet. You should lock this down in the [firewall](https://dashboard.civo.com/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster; access from your applications within Kubernetes will not be affected.

### Find your generated password

Your admin password was auto-generated during installation. You can retrieve it with:

```sh
kubectl get secret everest -n everest-system -o jsonpath='{.data.password}' | base64 --decode; echo
```

### Log in to the Web UI

1. Open your browser and navigate to the URL from the "Obtain access" section above
2. Login with:
   - **Username:** `admin`
   - **Password:** The password retrieved from the secret above

### Create your first database

1. Click "Create Database" in the OpenEverest UI
2. Choose your database engine
3. Configure your cluster settings (node count, storage size, version)
4. Click "Create"

OpenEverest will automatically provision the database using the appropriate Kubernetes operators.

### Command Line Access

You can also manage databases via kubectl:

```sh
# List all database clusters
kubectl get databaseclusters -n everest

# Get database credentials
kubectl get secrets -n everest <db-name>-secrets -o yaml
```

## Next steps

* Read the [OpenEverest Documentation](https://openeverest.io/documentation/current)
* Join the [Community](https://openeverest.io/#community)
* Check out the [GitHub Repository](https://github.com/openeverest/openeverest)
