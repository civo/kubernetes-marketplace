## Rancher - the dashboard will have your civo kubernetes cluster imported already

### External access

By Default Rancher will create an ingress in the cattle-system namespace.
Note - the install is in such a way that it uses your cluster DNS which will work with Traefik-Nodeport ingress controller, if you happen to install any other ingress controller or as a loadbalancer then you would have to make the changes accordingly. 


```
kubectl get ing -n cattle-system
NAMESPACE       NAME                                   CLASS    HOSTS                                                    ADDRESS        PORTS     AGE
cattle-system   rancher                                <none>   rancher.${CLUSTER_ID}.k8s.civo.com                                             80, 443   38h
cattle-system   cm-acme-http-solver-jstgl              nginx    rancher.${CLUSTER_ID}.k8s.civo.com                            
```
To open up the dashboard you can visit https://rancher.${CLUSTER_ID}.k8s.civo.com
