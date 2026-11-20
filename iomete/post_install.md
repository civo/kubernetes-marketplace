## IOMETE Data Plane Operator Installed

The IOMETE Operator has been successfully installed in the `iomete-operator-system` namespace and is ready to deploy IOMETE Data Plane instances.

### Next Steps

#### 1. Verify the Operator Installation

Check that the operator is running:

```bash
kubectl get pods -n iomete-operator-system
kubectl get deployment -n iomete-operator-system
```

#### 2. Prepare Prerequisites

The data plane **connects to** these — it does not create them for you. Set them up before applying the custom resource below.

**Cluster sizing.** The data plane runs Spark and is memory-heavy (the always-on Spark Connect driver alone requests ~9 GiB). Use nodes large enough to hold it — at least one node with 16 GB+ RAM (e.g. Civo `g4m.kube.small`), plus headroom for Spark jobs. On undersized nodes, pods stay `Pending` with `Insufficient memory`.

**PostgreSQL — create the databases and user.** The installer requires these databases to already exist (all sharing the `prefix` set in the CR). Connect to your PostgreSQL and run:

```sql
CREATE DATABASE iomete_core_db;
CREATE DATABASE iomete_iam_db;
CREATE DATABASE iomete_sql_db;
CREATE DATABASE iomete_iceberg_db;
CREATE DATABASE iomete_metastore_db;
CREATE DATABASE iomete_catalog_db;

CREATE USER iomete_user WITH PASSWORD 'iomete_pass';
GRANT ALL PRIVILEGES ON DATABASE
  iomete_core_db, iomete_iam_db, iomete_sql_db,
  iomete_iceberg_db, iomete_metastore_db, iomete_catalog_db
  TO iomete_user;
```

The user/password/prefix must match the `database` section of the CR below. Full init script (with per-schema grants): https://github.com/iomete/iomete-deployment/blob/main/database/postgresql/database-init-postgres.sql

**Object storage — create the bucket.** Create the bucket referenced by `storage.bucketName` (e.g. `lakehouse`) in your MinIO/S3/GCS/Azure storage, and have its access credentials ready.

#### 3. Create an IOMETE Data Plane Instance

Create a custom resource file (e.g., `iomete-dataplane.yaml`):

```yaml
apiVersion: charts.iomete.com/v1alpha1
kind: IometeDataPlaneEnterprise
metadata:
  name: my-dataplane
  namespace: default
spec:
  # Data plane name
  name: iomete-data-plane

  # Admin user configuration
  adminUser:
    username: admin
    email: admin@example.com
    firstName: Admin
    lastName: User
    temporaryPassword: ChangeMe123!

  # Database configuration
  database:
    type: postgresql
    host: postgresql.default.svc.cluster.local
    port: 5432
    user: iomete_user
    password: iomete_pass
    prefix: iomete_

  # Storage configuration (MinIO example)
  storage:
    bucketName: lakehouse
    type: minio
    minioSettings:
      endpoint: http://minio.default.svc.cluster.local:9000
      accessKey: minioadmin
      secretKey: minioadmin

  # Docker registry (public images)
  docker:
    repo: iomete.azurecr.io/iomete
    pullPolicy: Always
    defaultSparkVersion: 3.5.5-v11

  # Optional: Enable features
  featureFlags:
    jobOrchestrator: true
    eventStream: true
    enableCollaborativeSqlEditor: true
```

Apply the configuration:

```bash
kubectl apply -f iomete-dataplane.yaml
```

#### 4. Monitor the Deployment

Watch the data plane deployment progress:

```bash
# Check the custom resource status
kubectl get iometedataplaneenterprises -n default

# Watch operator logs
kubectl logs -n iomete-operator-system deployment/iomete-operator-controller-manager -f

# Check deployed resources
kubectl get all -n default -l app.kubernetes.io/instance=my-dataplane
```

#### 5. Access the IOMETE Console

Once deployed, access the IOMETE console:

```bash
# Port forward to the gateway service
kubectl port-forward svc/iom-gateway -n default 8080:80

# Open in browser: http://localhost:8080
# Login with the admin credentials you specified
```

### Key Features

**Data Platform Capabilities:**
- Lakehouse analytics with Apache Iceberg
- Spark-based data processing
- Interactive SQL queries
- Event stream/ingestion for real-time data
- Automatic table maintenance and optimization
- Collaborative SQL editor

**Storage Options:**
- MinIO (in-cluster or external)
- AWS S3
- Google Cloud Storage
- Azure Blob Storage
- Dell ECS

**Database Support:**
- PostgreSQL (recommended)

### Documentation

- [IOMETE Documentation](https://docs.iomete.com)
- [Operator GitHub Repository](https://github.com/iomete/iomete-operator)
- [IOMETE Website](https://iomete.com)

### Support

For questions or issues:
- Email: support@iomete.com, aslan@iomete.com
- Documentation: https://docs.iomete.com
- GitHub Issues: https://github.com/iomete/iomete-operator/issues
