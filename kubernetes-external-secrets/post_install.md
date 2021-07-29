# Kubernetes External Secrets

Kubernetes External Secrets allows you to use external secret management systems,
like [AWS Secrets Manager](https://aws.amazon.com/secrets-manager/) or
[HashiCorp Vault](https://www.vaultproject.io/), to securely add secrets in Kubernetes. Read more about the design and
motivation for Kubernetes External Secrets on
the [GoDaddy Engineering Blog](https://godaddy.github.io/2019/04/16/kubernetes-external-secrets/).

The community and maintainers of this project and related Kubernetes secret management projects use
[`#external-secrets`](https://kubernetes.slack.com/archives/C017BF84G2Y)
channel on the Kubernetes slack for discussion and brainstorming.

## How it works

The project extends the Kubernetes API by adding an `ExternalSecrets` object
using [Custom Resource Definition](https://kubernetes.io/docs/concepts/extend-kubernetes/api-extension/custom-resources/)
and a controller to implement the behavior of the object itself.

An `ExternalSecret` declares how to fetch the secret data, while the controller converts all `ExternalSecrets`
to `Secrets`. The conversion is completely transparent to `Pods` that can access `Secrets` normally.

By default `Secrets` are not encrypted at rest and are open to attack, either via the etcd server or via backups of etcd
data. To mitigate this risk, use an
[external secret management system with a KMS plugin](https://kubernetes.io/docs/tasks/administer-cluster/kms-provider/)
to encrypt `Secrets` stored in etcd.

## More details

See https://github.com/external-secrets/kubernetes-external-secrets/blob/master/README.md for the usage of the different
backends