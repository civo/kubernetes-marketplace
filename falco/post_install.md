## Falco is a Cloud Native Runtime Security tool designed to detect anomalous activity in your applications

Falco community on Slack can help with the chart if there are any questions, but Civo are responsible for the install.sh and manifest.yaml

### Get started

* [Falco Security docs](https://falco.org/docs/)
* [Add your Rules](https://falco.org/docs/rules/)

Falco does not Expose to Web out of the box. You can use Following command 
``` kubectl port-forward service/falco-falcosidekick-ui 2802:2802 -n falco ```, but it's already noticed that it can trigger events because of kubectl port-forward triggers a Falco rule.

You can use following link to get more resources [at this Blog](https://blog.webdev-jogeleit.de/blog/falco-security-and-monitoring-on-rke-bare-metal-cluster-with-rancher/).

For advanced configurations like ingress visit [Values.yaml](https://github.com/falcosecurity/charts/blob/427bf5c8eb1a80b93e142376eb338bde4efa899a/falcosidekick/values.yaml#L211).

Civo tutorial on [Securing a K3s cluster with Falco](https://www.civo.com/learn/securing-a-k3s-cluster-falco).
