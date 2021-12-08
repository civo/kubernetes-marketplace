## Fission

Fission is a fast, open source serverless framework for Kubernetes with a focus on developer productivity and high performance.

### Configure Kubernetes access with CLI

List Kubernetes Clusters with `civo k8s ls` and select the cluster you want to connect to.

Download the Kubernetes cluster config and use it to connect with cluster.

```sh
civo k8s config --save <cluster-name>
```

Access the cluster with `kubectl`:

```sh
kubectl config use-context <cluster-name>
kubectl get node
```

### Fission CLI

Refer steps in Fission documentation to [install Fission CLI](https://fission.io/docs/installation/#install-fission-cli).

Once the Fission CLI is installed, you can use it to create and manage Fission functions and other resources.

### Sample Node.js function

```sh
# Add the stock NodeJS env to your Fission deployment
$ fission env create --name nodejs --image fission/node-env

# A javascript function that prints "hello world"
$ curl -LO https://raw.githubusercontent.com/fission/examples/master/nodejs/hello.js

# Upload your function code to fission
$ fission function create --name hello-js --env nodejs --code hello.js

# Test your function.  This takes about 100msec the first time.
$ fission function test --name hello-js
Hello, world!
```

For other languages [refer documentation](https://fission.io/docs/installation/#run-an-example).

### Next Steps

- Refer [Fission Documentation](https://fission.io/docs/) for more information.
- Join [the Fission Slack](https://fission.io/slack) to get help.
- Fission source code on [GitHub](https://github.com/fission/fission)
