## KubeVela

KubeVela is a modern software delivery control plane. The goal is to make deploying and operating applications across 
today's hybrid, multi-cloud environments easier, faster and more reliable. KubeVela is a [CNCF](https://cncf.io) project. 
Welcome onboard and sail Vela!

### Install Vela CLI

Download and install the latest `vela` CLI in your local machine:

```shell
curl -fsSl https://kubevela.net/script/install.sh | bash
```

### Install VelaUX

VelaUX provides end-to-end application delivery and management experience, including API services and UI dashboard. It's
an addon to KubeVela, and can be installed by the following command:

```shell
vela addon enable velaux
```

Expected output:

```shell
Addon: velaux enabled Successfully.
```

Access the VelaUX dashboard by

```shell
vela port-forward addon-velaux -n vela-system 9082:80
```

Choose > local | velaux | velaux for visit. The default username is admin and the password is VelaUX12345. 
Please must set and remember the new password after the first login.

For more instruction about enable VelaUX with different options, please refer to [VelaUX](https://kubevela.net/docs/reference/addons/velaux).

### Using KubeVela

KubeVela using a unified model to describe the application. To get started:

1. Deploy your [first application](https://kubevela.net/docs/quick-start) with either CLI or VelaUX.
2. Get more familiar with [Application delivery model](https://kubevela.net/docs/getting-started/core-concept)

### Support

If you need help, welcome to the [community](https://github.com/kubevela/community#communication) to ask questions. Or 
open an issue in [GitHub](https://github.com/kubevela/kubevela/issues)
