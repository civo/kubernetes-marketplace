## Ambassador Edge Stack
Ambassador Edge Stack - An Envoy-Powered API Gateway. It creates a service edge-stack of type LoadBalancer  which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge).

[Ambassador Edge Stack](https://www.getambassador.io/docs/edge-stack) is a Kubernetes-native API Gateway built on the Envoy Proxy which can route and secure traffic to your kubernetes cluster.

### Pre-Requisites

To sucessfully configure Ambassador Edge Stack, you need to get free community license for your ambassador cloud by [following this guide](https://www.getambassador.io/docs/edge-stack/latest/tutorials/getting-started).

Run below command to reconfigure Ambassador Edge Stack with the Ambassador cloud key obtained in above step:

```
helm upgrade --install -n ambassador --create-namespace edge-stack datawire/edge-stack --set controller.image.tag=3.8.0 --set emissary-ingress.createDefaultListeners=true --set emissary-ingress.agent.cloudConnectToken=<your key from Ambassador Cloud> && kubectl rollout status  -n ambassador deployment/edge-stack -w
```

### Get started

[Quickstart guide for ambassador edge stack.](https://www.getambassador.io/docs/edge-stack/latest/tutorials/getting-started)

