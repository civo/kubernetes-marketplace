# Node-RED

## External Access

An Ingress is created during the installation process. To access your Node-RED use http://nodered.YOUR_CLUSTER_ID.k8s.civo.com

If you want to change the hostname or modify the ingress, edit it with

```
kubectl edit ingress nodered
```

## Documentation

You can find documentation, tutorials, recipes and more in <https://nodered.org/docs/>

## Library

Don't Repeat Yourself, visit <https://flows.nodered.org/> to find nodes and flows developed by other people or to share yours.
