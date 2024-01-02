## Otomi

Otomi is a self-hosted PaaS for Kubernetes and adds developer- and operations-centric tools, automation, and self-service on top of Kubernetes in any infrastructure or cloud, to code, build, and run containerized applications.

## Minimal requirements

Otomi installs and configures Nginx as a default ingress controller. When launching from the marketplace, make sure to unselect the default Traefik v2 (NodePort).

Check the minimal requirements for running Otomi on Civo [here](https://otomi.io/docs/get-started/prerequisites#civo).

## Access and activation

Follow the steps described [here](https://otomi.io/docs/get-started/activation) after initial installation.

## Switch from nip.io to Civo DNS

When Otomi is installed using the Civo marketplace, Otomi will use a generated (untrusted) CA and use the ip address of the load balancer with nip.io for all the host names. To see the full potential of Otomi, it is advised to install Otomi with DNS or to switch to using a DNS zone. 

### Switch to using Civo DNS after installing Otomi using Civo marketplace

In Civo:

* Under `Networking` in the Civo Dashboard, click `DNS` and then `Add a domain name`
* Fill in a domain name and then click `Add domain`
* Create a NS record in the zone where your domain is hosted and add the Civo name servers `ns0.civo.com` ans `ns1.civo.com`
* Under `Settings`, `Profile`, click on the tab `Security` and copy the `API key`

In Otomi:

Follow the instructions [here](https://otomi.io/docs/for-ops/how-to/switch-to-dns).

### Install Otomi on Civo with Civo DNS

Follow the instructions [here](https://otomi.io/docs/get-started/installation/civo#configure-dns) to install Otomi on Civo using Civo DNS.

## Known installation issues

Check the known issues when installing Otomi on Civo [here](https://otomi.io/docs/get-started/known-issues).
## Next steps

* Compose your platform by activating the K8s apps you would like to use
* Create a [Team](https://otomi.io/docs/for-ops/console/teams#creating-new-teams) in Otomi
* Go through the [Get Started Labs](https://otomi.io/docs/for-devs/get-started/overview)
* Join our [Slack channel](https://join.slack.com/t/otomi/shared_invite/zt-1axa4vima-E~LHN36nbLR~ay5r5pGq9A)
* Get involved on [GitHub](https://github.com/redkubes/otomi-core)

