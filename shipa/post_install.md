# Shipa
## Getting Started
To access the Shipa UI with this installation, you will need to install the Shipa CLI on your local machine.

```
curl -s https://storage.googleapis.com/shipa-client/install.sh | bash
```

### Wiring
Shipa for itself installs Nginx as a default ingress controller for the control plane which needs a public IP. If
leveraging Civo, make sure as of Shipa 1.6.0, to unselect default Traefik [and any other ingress controllers] from the launch Marketplace
when spinning up a Civo Cloud instance. Civo will be introducing an LBAAS service which will allow for this. Use your provided Marketplace
e-mail and password to login to the Shipa CLI. You will need kubectl access to the cluster initialy to get the ingress address. 


```
#Wire Client and Get Shipa Dashboard URL

export SHIPA_HOST=$(kubectl --namespace=shipa-system get svc shipa-ingress-nginx -o jsonpath="{.status.loadBalancer.ingress[0].ip}") && if [[ -z $SHIPA_HOST ]]; then export SHIPA_HOST=$(kubectl --namespace=shipa-system get svc shipa-ingress-nginx -o jsonpath="{.status.loadBalancer.ingress[0].hostname}") ; fi

shipa target add shipa $SHIPA_HOST --set-current

shipa login
```

After you login via the CLI, running "shipa app list" will bring you to the dashboard

```
shipa app list

+-------------+-----------+---------------+------------------------------------------------------------+
| Application | Status    | Shipa Managed | Address                                                    |
+-------------+-----------+---------------+------------------------------------------------------------+
| dashboard   | 1 running | true          | http://dashboard.212.2.242.215.shipa.cloud                 |
+-------------+-----------+---------------+------------------------------------------------------------+
```

When accessing the dashboard for the first time, you will need to activate e.g validate the product. The
product defaults to the free tier. 

- [Activation Instructions](https://learn.shipa.io/docs/activating-shipa)

## Next Steps
The next steps will be to create a Shipa Framework, bind a Kubernetes Cluster to Shipa, and
then deploy an Applicaiton through Shipa. Shipa also integrates with several IaCs such as Terraform
and Crossplane and CI/CD solutions such as ArgoCD and Harness. 

Congratulations on your Shipa Installation and future abstractions! 

## Futher Information
Here are a few pieces for further information.

- [One Line Developer Experience](https://shipa.io/one-line-developer-experience/)
- [Shipa Docs](https://learn.shipa.io/docs)

