## Falco is a Cloud Native Runtime Security tool designed to detect anomalous activity in your applications

### Get started

[Falco Security docs](https://falco.org/docs/)


[Add your Rules](https://falco.org/docs/rules/)

Falco does not Expose to Web out of the box. You can use Following command 
``` kubectl port-forward service/falco-falcosidekick-ui 2802:2802 -n falco ```, But it's already noticed that it trigger events because kubectl port-forward triggers a Falco rule.

You can use following link to get more resources [At this Blog](https://blog.webdev-jogeleit.de/blog/falco-security-and-monitoring-on-rke-bare-metal-cluster-with-rancher/)