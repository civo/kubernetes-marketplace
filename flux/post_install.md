## Flux

Flux is a Continuous Delivery solution for Kubernetes.
Flux is constructed with the [GitOps Toolkit](https://fluxcd.io/flux/components/),
a set of composable APIs and specialized tools for keeping Kubernetes clusters in sync
with sources of configuration (like Git & Helm repositories), and automating updates
to configuration when there is new code to deploy.

Flux is a [CNCF](https://www.cncf.io/) project made for:

- **cluster operators** who automate provision and configuration of clusters
- **platform engineers** who build continuous delivery for developer teams
- **app developers** who rely on continuous delivery to get their code live

### Usage instruction

To get started with Flux, [browse the documentation](https://fluxcd.io) or try the following guides:

- [Get started with Flux](https://fluxcd.io/flux/get-started/)
- [GitOps workflow for multi-env deployments with Flux, Kustomize and Helm](https://github.com/fluxcd/flux2-kustomize-helm-example)
- [Manage Kubernetes secrets with Mozilla SOPS](https://fluxcd.io/flux/guides/mozilla-sops/)
- [Automate container image updates to Git](https://fluxcd.io/flux/guides/image-update/)
- [Manage multi-tenant clusters with Flux](https://github.com/fluxcd/flux2-multi-tenancy)
- [Automating Kubernetes Deployments with GitOps and Flux](https://www.civo.com/learn/gitops-and-flux)
- [Automate GitOps Pipeline for Node.js with Flux CD on Kubernetes](https://www.civo.com/learn/gitops-using-helm3-and-flux-for-an-node-js-and-express-js-microservice)
- 

## Upgrade instruction

Install the latest Flux CLI:

- Homebrew: `brew install fluxcd/tap/flux`
- Bash: `curl -s https://fluxcd.io/install.sh | sudo bash`

Binaries for macOS AMD64/AARCH64, Linux AMD64/ARM and Windows are available for download on the
[release page](https://github.com/fluxcd/flux2/releases).

Set the Kubernetes context to your Civo instance and run:

```sh
flux install --context=my-civo-cluster
```

The above command will upgrade the Flux controllers on your cluster, if a newer version is available.

### Support

If you need help, please refer to the [support page](https://fluxcd.io/support/).
