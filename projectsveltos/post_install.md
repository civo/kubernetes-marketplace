## Projectsveltos

Sveltos is a Kubernetes add-on controller that simplifies the deployment and management of add-ons and applications across multiple clusters. It runs in the management cluster and can programmatically deploy and manage add-ons and applications on any cluster in the fleet, including the management cluster itself. Sveltos supports a variety of add-on formats, including Helm charts (support for OCI registries), raw YAML, Kustomize, Carvel ytt, and Jsonnet.

<p align="center">
  <img alt="Sveltos Kubernetes add-ons management across clusters" src="https://projectsveltos.github.io/sveltos/assets/multi-clusters.png" width="600"/>
</p>

Sveltos allows you to represent add-ons and applications as templates. Before deploying to managed clusters, Sveltos instantiates these templates. Sveltos can gather the information required to instantiate the templates from either the management cluster or the managed clusters themselves. This enables you to use the same add-on configuration across all of your clusters, while still allowing for some variation, such as different add-on configuration values. In other words, Sveltos lets you define add-ons and applications in a reusable way. You can then deploy these definitions to multiple clusters, with minor adjustments as needed. This can save you a lot of time and effort, especially if you manage a large number of clusters.

Sveltos provides precise control over add-on deployment order. Add-ons within a Profile/ClusterProfile are deployed in the exact order they appear, ensuring a predictable and controlled rollout. Furthermore, ClusterProfiles can depend on others, guaranteeing that dependent add-ons only deploy after their dependencies are fully operational. Finally Sveltos' event-driven framework offers additional flexibility. This framework allows for deploying add-ons and applications in response to specific events, enabling dynamic and adaptable deployments based on your needs.

### Add-on deployment

1. from the management cluster, selects one or more `clusters` with a Kubernetes [label selector](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors);
2. lists which Kubernetes add-ons need to be deployed on such clusters;
3. add-ons can be expressed as templates and instantiated by Sveltos at deployment time using resources from the management cluster.

### Register a cluster with Projectsveltos

Sveltos comes with support to automatically discover ClusterAPI powered clusters. If Sveltos is deployed in a management cluster with ClusterAPI (CAPI), no further action is required for Sveltos to manage add-ons on CAPI-powered clusters. Sveltos will watch for "clusters.cluster.x-k8s.io" instances and program those accordingly.

Other clusters (on-prem, Cloud) can be registered with Sveltos easily. Afterwards, Sveltos can manage Kubernetes add-ons on all the clusters seamlessly. Please follow [documentation](https://projectsveltos.github.io/sveltos/register/register-cluster/).

For instance, to register a Civo Cloud Kubernetes cluster, simply download the cluster Kubeconfig and perform the below.

```
sveltosctl register cluster --namespace=<namespace> --cluster=<cluster name> \
    --kubeconfig=<path to file with Kubeconfig>
```

### Install Projectsveltos CLI

The Sveltosctl is the command-line interface (CLI) for Sveltos. It is an available option to query Sveltos resources but not a mandatory option.

It offers a convenient CLI experience. The Binaries for each release are available on the [releases page](https://github.com/projectsveltos/sveltosctl/releases).


### Using Projectsveltos

The main goal of Sveltos is to deploy add-ons and applications in a fleet of managed Kubernetes clusters. To get started:

1. Deploy your [first application](https://projectsveltos.github.io/sveltos/getting_started/install/quick_start/).
2. Get more familiar with [Deploying add-ons](https://projectsveltos.github.io/sveltos/addons/addons/)

### Support

If you need help, welcome to the [community](https://join.slack.com/t/projectsveltos/shared_invite/zt-1hraownbr-W8NTs6LTimxLPB8Erj8Q6Q) to ask questions. Or
open an issue in [GitHub](https://github.com/projectsveltos/addon-controller/issues)
