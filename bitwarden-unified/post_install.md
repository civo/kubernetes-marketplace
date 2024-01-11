## Bitwarden Unified BETA

### HTTPS

An ingress is automatically created during the application install. A certificate using cert manager and lets-encrypt is also applied automatically and registered against your Civo email address and the generated domain name.

### Post installation

You will need to follow the Bitwarden documentation to populate the config map to suit your requirements, the example below gives you a starting point. 

When connecting to an external database, you must ensure the database exists on the server and your user has sufficient permissions.

#### Example changes to config map:

```
apiVersion: v1
kind: ConfigMap
metadata:
  name: bitwarden-configmap
  labels:
    app: bitwarden
data:
  BW_DOMAIN: bitwarden.myclusterID.k8s.civo.com
  BW_DB_PROVIDER: ""
  BW_DB_SERVER: ""
  BW_DB_DATABASE: ""
  BW_DB_USERNAME: ""
  BW_DB_PASSWORD: ""
  BW_INSTALLATION_ID: ""
  BW_INSTALLATION_KEY: ""
```  

You should then be able to connect to your Bitwarden instance using the URL.