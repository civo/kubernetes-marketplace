## NeuVector Container Security Platform

### External access
By Default NeuVector will be exposed as a NodePort service and you will be able to find the NodePort using command 

```
NODE_PORT=$(kubectl get --namespace neuvector -o jsonpath="{.spec.ports[0].nodePort}" services neuvector-service-webui)
echo $NODE_PORT
```

Once you have the NodePort, you can access by NODE_IP (you can find from the kubeconfig file or from the Civo UI) :NODE_PORT. The default username:password is admin:admin.

For more information, you can visit the [NeuVector Website](https://open-docs.neuvector.com/deploying/kubernetes/).
