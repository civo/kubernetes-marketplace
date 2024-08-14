## Sonatype Nexus Repository oss

* Single source of truth for all of your components, binaries, and build artifacts.
* Efficiently distribute parts and containers to developers.
* Deployed at more than 100,000 organizations globally.

### Get started

[Sonatype Nexus Repository OSS](https://www.sonatype.com/products/sonatype-nexus-oss)

[Sonatype Nexus Repository Documentation.](https://help.sonatype.com/index.html)

[Using Nexus Repository](https://www.sonatype.com/blog/using-sonatype-nexus-repository-3-part-1-maven-artifacts)

[Using Mirrors for Repositories with Maven](https://maven.apache.org/guides/mini/guide-mirror-settings.html)

### Admin Credentials

The nexus url is set with default admin credentials with `username` as `admin` and password `admin123`. 

__IMPORTANT__: It is highly recommended that you change the `admin` password on first login.

## Nexus Service 

The nexus service is available in namespace `nexus3`:

```shell
kubectl get service -n nexus3 nexus3-nexus-repository-manager
```

## Using the Service

### Outside the cluster

__NOTE__: The service does not configured with Public IP, please use Kubernetes Ingress to expose the service to outside world.

Create an ingress:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: nexus3
  namespace: nexus3
spec:
  rules:
  - http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: nexus3-nexus-repository-manager
            port:
              number: 8081
```

Get the application url and open it in the browser:

```shell
open "$(kubectl get ing -n nexus3 nexus3 -o=jsonpath='{.status.loadbalancer.ingress[0].ip}')"
```

### Inside the Cluster

The nexus repository is always accessible within the cluster via the in cluster URL `http://nexus3-nexus-repository-manager.nexus3.svc.cluster.local:8081/repository/maven-public/`

### With Tektoncd Tasks

If you wish to use the Nexus repository manager with [Tekton](https://tekton.dev), you can configure your Java applications to use the deployed nexus as its Maven Mirror using `MAVEN_MIRROR_URL` environment variable. The environment variable will point to the in cluster repository URL `http://nexus3-nexus-repository-manager.nexus3.svc.cluster.local:8081/repository/maven-public/`

You can check more details with the [Tektoncd Maven Task](https://hub.tekton.dev/tekton/task/maven).

## Nexus Configuration

The nexus configuration properties are stored in a ConfigMap called `nexus-repository-manager-properties` in namespace `nexus3`. If you with to change any nexus configuration, update the ConfigMap and bounce the nexus3 pod.
