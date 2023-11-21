## Paralus

Paralus is a free, open source tool that enables controlled, audited access to Kubernetes infrastructure. It comes with just-in-time service account creation and user-level credential management that integrates with your RBAC and SSO. Ships as a GUI, API, and CLI.

It offers access management for developers, architects, and CI/CD tools to remote K8s clusters by consolidating zero-trust access principles such as transaction-level authentication and authorization into a single open-source tool. It helps engineering and architecture teams streamline access control for their fleet of Kubernetes clusters spanning different operating environments, different public clouds and Kubernetes distributions, and on-premises data centers operating behind firewalls.

Paralus can be easily integrated with your pre-existing SSO providers, or Identity Providers (IdP) that support OIDC (OpenID Connect).

![Paralus High Level Architechture](https://www.paralus.io/img/paralus_hld.png "Paralus HLA")

Some of Paralus' key features include:

* Creation of custom roles, users, and groups.
* Custom user role creation and revoking of permissions.
* Ability to control access via pre-configured roles across clusters, namespaces, projects, and more.
* Seamless integration with Identity Providers (IdPs) allowing the use of external authentication engines for users and group definitions, such as GitHub, Google, Azure AD, Okta, and others.
* Automatic logging of all user actions performed for audit and compliance purposes.
* Interact with Paralus either with a modern web GUI (default), a CLI tool called pctl, or Paralus API.

## External Access
Once the installation is complete, you may need to configure your DNS Settings to start accessing the dashboard

```
kubectl get svc paralus-ztka-contour-envoy -n paralus

NAME                               TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)                         AGE
paralus-ztka-contour-envoy         LoadBalancer   10.0.33.6      34.121.64.88   80:30193/TCP,443:30873/TCP      3m13s   
```

Note down the EXTERNAL-IP address for the <releasename>-contour-envoy service.

Navigate to your domain's DNS setting page. The steps for changing DNS settings will vary based on your domain name provider.

While you are on your DNS Setting page, for the selected domain name, you need to add three A records. These will be based on the subdomains provided in the notes section post installation.

Type |	Address |	Resolves To |	TTL
--- | --- | --- | ---
A |	console.paralus.${CLUSTER_ID}.k8s.civo.com |	34.121.64.88 |	1 Hour
A |	*.core-connector.paralus.${CLUSTER_ID}.k8s.civo.com |	34.121.64.88 |	1 Hour
A |	*.user.paralus.${CLUSTER_ID}.k8s.civo.com |	34.121.64.88 |	1 Hour

Checkout a similar documentation at https://www.paralus.io/blog/eks-quickstart#configuring-dns-settings

Reset your default password by following steps from https://www.paralus.io/blog/paralus-quickstart-gke#resetting-default-password

Check out the Paralus docs and various installation and usage guides at https://www.paralus.io/. 