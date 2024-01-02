## Keptn
Keptn installs nginx as a LoadBalancer which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge).

### Start using Keptn

```yaml
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: traefik-crd
  namespace: kube-system
spec:
  chart: https://%{KUBERNETES_API}%/static/charts/traefik-crd-10.3.0.tgz
---
apiVersion: helm.cattle.io/v1
kind: HelmChart
metadata:
  name: traefik
  namespace: kube-system
spec:
  chart: https://%{KUBERNETES_API}%/static/charts/traefik-10.9.100.tgz
  set:
    global.systemDefaultRegistry: ""
  valuesContent: |-
    deployment:
      kind: DaemonSet
    rbac:
      enabled: true
    ports:
      websecure:
        tls:
          enabled: true
    podAnnotations:
      prometheus.io/port: "8082"
      prometheus.io/scrape: "true"
    providers:
      kubernetesIngress:
        publishedService:
          enabled: true
    priorityClassName: "system-cluster-critical"
    image:
      name: "rancher/mirrored-library-traefik"
    tolerations:
    - key: "CriticalAddonsOnly"
      operator: "Exists"
    - key: "node-role.kubernetes.io/control-plane"
      operator: "Exists"
      effect: "NoSchedule"
    - key: "node-role.kubernetes.io/master"
      operator: "Exists"
      effect: "NoSchedule"
```

1. Download the Keptn CLI: 
  ```
  curl -sL https://get.keptn.sh | sudo -E bash
  ```

1. Before you connect your CLI to your Keptn installation in Civo, make sure that Keptn is ready.

  ```
  kubectl get deploy -n keptn
  ```

  If all deployments are ready and available, please proceed to the next step.


1. Connect the CLI to the Keptn installation
  ```  
  KEPTN_ENDPOINT=http://$(kubectl -n keptn get service api-gateway-nginx -o jsonpath='{$.status.loadBalancer.ingress[0].ip}')/api
  KEPTN_API_TOKEN=$(kubectl get secret keptn-api-token -n keptn -ojsonpath={.data.keptn-api-token} | base64 --decode)

  keptn auth --endpoint=$KEPTN_ENDPOINT --api-token=$KEPTN_API_TOKEN
  ```

1. Access the bridge via:
  ```
  keptn configure bridge --output
  ```

1. Follow the [tutorials](https://tutorials.keptn.sh/?cat=quality-gates) to get started! Please note that Keptn is already installed and these parts of the tutorials can be skipped :)

## Documentation and tutorials

- Find more information in the [Keptn documentation](https://keptn.sh/latest/docs/).
- Check out the [Keptn tutorials](https://keptn.sh/latest/docs/use-cases/) that help you get started with different use-cases.
