# Cyclops

[Cyclops](https://cyclops-ui.com/) is a customizable user interface for Kubernetes. You can create custom UIs for your
specific use cases. Cyclops comes with defined UIs out of the box, but you are free to create your own. Check our
[docs](https://cyclops-ui.com/docs/templates/) on creating custom UIs.

## Usage

To expose Cyclops outside of your cluster, you can port-forward the `cyclops-ui` service:

```
kubectl port-forward svc/cyclops-ui 3000:3000 -n cyclops
```

or expose it using a [Civo Load Balancer](https://www.civo.com/load-balancers).

## Details

Cyclops creates a new namespace, `cyclops,` and installs the Cyclops UI and Cyclops controller in it.

```sh
kubectl get pods -n cyclops
kubectl get services -n cyclops
```
