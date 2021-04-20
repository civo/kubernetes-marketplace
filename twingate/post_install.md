## Twingate - Connector Settings

In order to get the connector up and running you need to register at [Twingate](https://twingate.com) and provide a few configuration settings for you new connector. 
If you are not familiar with Twingate it is recommended to follow our First-time Configuration guide

The settings are passed via a ConfigMap and a Secret. 

### ConfigMap settings

This will help you to create a valid configuration you only need replace `example.twingate.com` by your network domain.
The value should be similar to what you see in your browser while in the admin console.
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: connector
data:
  url: https://example.twingate.com
```

### Secret settings

This will help you to create a valid secret you need replace `Access Token` and `Refresh Token` with the values you get from 
the Provision Connector screen

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
