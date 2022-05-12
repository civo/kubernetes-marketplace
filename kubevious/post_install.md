## Kubevious
Kubevious is an app-centric assurance, validation, and introspection platform for Kubernetes. It helps running modern Kubernetes applications without disasters and costly outages by continuously validating application manifests, cluster state and configuration. Kubevious detects errors(typos, misconfigurations, conflicts, inconsistencies) and violations of best practices. Kubevious' unique app-centric user interface delivers intuitive insight, introspection and troubleshooting tools for cloud-native applications. Right out of the box. Kubevious operates inside the cluster with user interface accessible as a web app. It only takes a couple of minutes to get Kubevious up and running for existing production applications.

For more information refer to the root repository: https://github.com/kubevious/kubevious

### Accessing Kubevious

You can access Kubevious Web UI by turning on port forwarding and accessing from the browser: http://localhost:8080
```
kubectl port-forward $(kubectl get pods -n kubevious -l "app.kubernetes.io/component=kubevious-ui" -o jsonpath="{.items[0].metadata.name}") 8080:80 -n kubevious  
```

#### Exposing Kubevious via Ingress
Apply the following Ingress configuration to expose Kubevious using Traefik gateway.

```
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: kubevious
  annotations:
    kubernetes.io/ingress.allow-http: "true"
spec:
  rules:
    - host: "kubevious.<your-cluster-id>.k8s.civo.com"
      http:
        paths:
          - path: /
            pathType: ImplementationSpecific
            backend:
              service:
                name: kubevious-ui-clusterip
                port:
                  number: 80
```

This will open up http://kubevious.YOUR_CLUSTER_ID.k8s.civo.com to the whole world.

       
