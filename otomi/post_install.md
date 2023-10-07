## Otomi

Otomi is a self-hosted PaaS for Kubernetes and adds developer- and operations-centric tools, automation, and self-service on top of Kubernetes in any infrastructure or cloud, to code, build, and run containerized applications.

## Minimal requirements

Otomi requires at least:

* A node pool with 3 Medium Standard nodes (more is preferred)
* A node pool with 3 Small Performance nodes 
* Kubernetes version `1.26` or `1.27`

## Access and activation

Follow the steps described [here](https://otomi.io/docs/get-started/activation) after initial installation.

## Running Otomi with Civo DNS

When Otomi is installed, it will use the load balancer IP with nip.io for name resolution. To unlock the full potential of Otomi, it's advised to run Otomi with DNS. You can configure DNS after installation. Follow these steps to configure Otomi with Civo DNS:

1. Under `Networking` in the Civo Dashboard, click `DNS` and then `Add a domain name`
2. Fill in a domain name and then click `Add domain`
3. Create a NS record in the zone where your domain is hosted and add the Civo name servers `ns0.civo.com` ans `ns1.civo.com`
4. Under `Settings`, `Profile`, click on the tab `Security` and copy the API key
5. Sign in to Otomi Console
6. In the left menu click on `Settings` and then `Otomi`
7. Enable `External DNS` and click on `Submit`
8. Go back to the `Settings` and click DNS
9. Under `Domain filters`, click `Add item` and fill in the domain name you just added in Civo
10. Under `Provider`, select `Civo Cloud` and fill in the Civo Api key in the `apiToken` field
11. Click `Submit`
12. In the left menu, go to `Apps` under `Platform`. Hoover over the `cert-manager` app and click on the configuration button
13. Click on the `Values` tab
14. Select `letsencrypt`, fill in a valid `email address` and select stage `production`
15. Click `Submit`
16. Now click on `Deploy Changes` in the top of the left menu bar

Note that the connection to the Console will be lost and you will need to reconnect using the new domain name `otomi.<your-domain>`.

Otomi supports the most popular cloud DNS services. Read more about using DNS in Otomi in de documentation (see link below).

## Next steps

* Read the [documentation](https://otomi.io)
* Join our [Slack channel](https://join.slack.com/t/otomi/shared_invite/zt-1axa4vima-E~LHN36nbLR~ay5r5pGq9A)
* Get involved on [GitHub](https://github.com/redkubes/otomi-core)

