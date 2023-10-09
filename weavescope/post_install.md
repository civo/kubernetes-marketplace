## WeaveScope

[WeaveScope](https://www.weave.works/docs/scope/latest/features/) automatically generates a map of your application, which allows you to understand, monitor, and control your containerized, microservices-based application.

### Get started

Bu-default, we haven't exposed weavescope directly via a load-balancer/nodeport. Doing so will allows anyone with access to the user interface control over your hosts and containers.

So we have to manually expose weavescope on browser using port forwarding.
```
kubectl port-forward -n weave "$(kubectl get -n weave pod --selector=weave-scope-component=app -o jsonpath='{.items..metadata.name}')" 4040
```
WeaveScope should be accessible now on - http://localhost:4040

Next go through all of its [features](https://www.weave.works/docs/scope/latest/features/) to play along.
