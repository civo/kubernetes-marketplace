## Gloo Edge - An Envoy-Powered API Gateway

[Gloo Edge](https://docs.solo.io/gloo-edge/latest/) is a feature-rich, Kubernetes-native ingress controller, and next-generation API gateway. Gloo Edge is exceptional in its function-level routing; its support for legacy apps, microservices and serverless; its discovery capabilities; its numerous features; and its tight integration with leading open-source projects. Gloo Edge is uniquely designed to support hybrid applications, in which multiple technologies, architectures, protocols, and clouds can coexist.

### Install glooctl

Download and Install `glooctl` in your local machine:

```shell
curl -sL https://run.solo.io/gloo/install | sh
export PATH=$HOME/.gloo/bin:$PATH
```

### Verify Gloo Edge Installation

```shell
glooctl check
```

The command should show the following output,

```text
Checking deployments... OK
Checking pods... OK
Checking upstreams... OK
Checking upstream groups... OK
Checking auth configs... OK
Checking rate limit configs... OK
Checking secrets... OK
Checking virtual services... OK
Checking gateways... OK
Checking proxies... OK
No problems detected.
I0523 12:42:00.367609   34554 request.go:645] Throttling request took 1.011522963s, request: GET:https://74.220.21.171:6443/apis/extensions/v1beta1?timeout=32s
Skipping Gloo Instance check -- Gloo Federation not detected
```

In case any of the checks fail you can try the gateway reinstall by:

```shell
# uninstall
glooctl uninstall gateway
# install again
glooctl install gateway
```

### Get started

[Deploy Hello World](https://docs.solo.io/gloo-edge/latest/guides/traffic_management/hello_world/)

### Documentation

[Gloo Edge Documentation.](https://docs.solo.io/gloo-edge/latest/)
