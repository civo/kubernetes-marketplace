## Epinio - the Application Development Engine for Kubernetes

To interact with the Epinio application install the latest epinio CLI with brew

```
brew install epinio
```

or get the latest version from https://github.com/epinio/epinio/releases/latest.

---

You can login from the cli with the `admin` user and the generated password `${ADMIN_PASSWORD}` (shown above). The `epinio` user has its own generated password, `${EPINIO_PASSWORD}`.

```
epinio login -u admin https://epinio.${CLUSTER_ID}.k8s.civo.com`
```

or open up the dashboard at: https://epinio.${CLUSTER_ID}.k8s.civo.com


For more information about Epinio, feel free to checkout https://epinio.io/ and https://docs.epinio.io/.
