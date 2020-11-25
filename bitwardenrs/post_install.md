## Bitwarden RS

### This project is not associated with the Bitwarden project nor 8bit Solutions LLC.

This is a Bitwarden server API implementation written in Rust compatible with upstream Bitwarden clients*, perfect for self-hosted deployment where running the official resource-heavy service might not be ideal.

### HTTPS

An ingress is automatically created during the application install. A certificate using cert manager and lets-encrypt is also applied automatically and registered against your Civo email address and the generated domain name.

### Post installation

Once you have installed this app you will be able to connect to the web interface via https://rs.YOUR_CLUSTER_ID.k8s.civo.com



