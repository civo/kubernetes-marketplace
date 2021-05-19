## Sonatype Nexus Repository oss

* Single source of truth for all of your components, binaries, and build artifacts.
* Efficiently distribute parts and containers to developers.
* Deployed at more than 100,000 organizations globally.

### Get started

[Sonatype Nexus Repository OSS](https://www.sonatype.com/products/repository-oss)

[Sonatype Nexus Repository Documentation.](https://help.sonatype.com/docs?topnav=true)

### Admin Credentials

The nexus url is set with default admin credentials with `username` as `admin` and password `admin123`. 

__IMPORTANT__: It is highly recommended that you change the `admin` password on first login.

## Nexus Service 

The nexus service is available in namespace `nexus3`:

```shell
kubectl get service -n nexus3 nexus3-nexus-repository-manager
```

__NOTE__: The service does not configured with Public IP, please use Kubernetes Ingress to expose the service to outside world.

## Using the Service

You can configure your Java applications to use the deployed nexus as its Maven Mirror.

e.g. a [Tektoncd Maven Task](https://hub.tekton.dev/tekton/task/maven) can use it by pointing the `MAVEN_MIRROR_URL` to `https://nexus3-nexus-repository-manager.nexus3.svc.cluster.local:8081/repository/maven-public/`

## Nexus Configuration

The nexus configuration properties are stored in a ConfigMap called `nexus-repository-manager-properties` in namespace `nexus3`. If you with to change any nexus configuration, update the ConfigMap and bounce the nexus3 pod.
