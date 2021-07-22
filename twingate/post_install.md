## Twingate Connector Settings

In order to configure and use the Twingate Connector, you first need to create a Twingate Network. You can [sign up](https://www.twingate.com) for a free trial account on our website. The [first-time configuration guide](https://docs.twingate.com/docs/twingate-configuration) covers the necessary steps for the initial configuration of your network. For more information on Twingate, please see our [documentation](https://docs.twingate.com/docs/how-twingate-works).

Twingate Connector settings are passed via a ConfigMap and a Secret, as detailed below.

### ConfigMap settings

This will help you to create a valid configuration. You only need to replace `example.twingate.com` in the snippet below with your Twingate Network fully-qualified domain name, which is configured when you create your Twingate Network.

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: connector
data:
  url: https://example.twingate.com
```

### Secret settings

This will help you to create a valid secret. You need to replace `Access Token` and `Refresh Token` in the snippet below with the values provided in the [Connector provisioning workflow](https://docs.twingate.com/docs/provision-the-new-access-node) in the Twingate Admin Console by selecting the "**Manual**" provisioning option.

```yaml
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: connector
stringData:
  accessToken: "Access Token"
  refreshToken: "Refresh Token"
```
