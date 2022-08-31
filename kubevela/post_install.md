## KubeVela

KubeVela is a modern software delivery control plane. The goal is to make deploying and operating applications across
today's hybrid, multi-cloud environments easier, faster and more reliable. KubeVela is a [CNCF](https://cncf.io) project.
Welcome onboard and sail Vela!

### Quick Start

VelaUX is enabled by default as a dashboard to helps you get started with KubeVela quickly. It provides end-to-end
application delivery and management experience.

You can access the VelaUX dashboard using the following command:

The default username is `admin` and the password is `VelaUX12345`.

```shell
kubectl port-forward svc/velaux -n vela-system 9082:80
```

Please must set and remember the new password after the first login.

### Install Vela CLI

Vela CLI is a command line tool for KubeVela. It provides a set of commands to help you manage your applications.
Download and install the latest `vela` CLI in your local machine:

```shell
curl -fsSl https://kubevela.net/script/install.sh | bash
```

### Using KubeVela

KubeVela using a unified model to describe the application. To get started:

1. Deploy your [first application](https://kubevela.net/docs/quick-start) with either CLI or VelaUX.
2. Get more familiar with [Application delivery model](https://kubevela.net/docs/getting-started/core-concept)

### Support

If you need help, welcome to the [community](https://github.com/kubevela/community#communication) to ask questions. Or
open an issue in [GitHub](https://github.com/kubevela/kubevela/issues)
