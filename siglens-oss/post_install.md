# SigLens-OSS

SigLens-OSS provides a powerful UI and an efficient ingestion server for handling your data. This document outlines how to access these components.

## Accessing SigLens UI

The SigLens UI can be accessed through `http://<YOUR_CLUSTER_EXTERNAL_IP>:5122/`. Replace `<YOUR_CLUSTER_EXTERNAL_IP>` with the external IP address of your cluster. This information can typically be found in your cloud provider's Kubernetes cluster dashboard or by querying your cluster's services if a LoadBalancer is used for the UI service.

## Resources

- **SigLens Website**: [https://www.siglens.com/](https://www.siglens.com/)
- **SigLens Docs**: [https://www.siglens.com/siglens-docs/](https://www.siglens.com/siglens-docs/)

## Ingestion Server Access

By default, external access to the ingestion port (8081) is not available. However, this can be easily changed by applying one of the following methods to your cluster with `kubectl apply -f <filename>.yaml` (ensure to replace `<filename>` with the actual name of your YAML file):

### Port Forwarding

For temporary access:

```bash
kubectl port-forward svc/siglens-oss-ingestion 8081:8081
```
This command forwards port 8081 from the siglens-oss-ingestion service (which should be targeting your ingestion pods on port 8081) to the same port on your local machine, allowing you to access the service at http://localhost:8081.

### Ingress
For a more robust solution, especially in production, ensure an Ingress controller is installed in your cluster:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: siglens-oss-ingestion-ingress
  annotations:
    kubernetes.io/ingress.class: "nginx" # Adjust if using a different Ingress controller
spec:
  rules:
  - http:
      paths:
      - path: /ingest
        pathType: Prefix
        backend:
          service:
            name: siglens-oss-ingestion
            port:
              number: 8081
```
This configuration routes external traffic from /ingest to the siglens-oss-ingestion service on port 8081.

  
### NodePort: 
This method makes the ingestion server accessible on a specified port on all nodes' IP addresses in the cluster:

```yaml
apiVersion: v1
kind: Service
metadata:
  name: siglens-oss-ingestion-nodeport
spec:
  type: NodePort
  ports:
    - port: 8081
      targetPort: 8081
      nodePort: 30081 # Optional: Specify a port in the NodePort range (30000-32767) if you want a specific port
  selector:
    app: siglens-oss
```

### Considerations

Depending on your requirements, you can choose any of the methods above. For similar external access like the SigLens UI using a LoadBalancer, apply a corresponding service configuration.

## Note

 *When exposing services externally, especially in production environments, consider security implications. Ensure endpoints are secured appropriately, such as using HTTPS for Ingress or implementing authentication mechanisms.*

    