## OpenFaaS

Thank you for deploying [OpenFaaS](https://github.com/openfaas/faas) to Civo's k3s service.

## Obtain access

The OpenFaaS gateway has been made available through a `LoadBalancer` on port 80 on each node through the use of a Host Port. This is a feature of `k3s`.

* Go to your Civo dashboard, click Kubernetes and then your OpenFaaS Cluster.

Look for the DNS entry that you find there, it may look something like `6c1c1646-25cf-44f0-9bd5-53ee35cd7c84.k8s.civo.com`

* Set the following URL:

```sh
export DNS="" # As per dashboard
export OPENFAAS_URL=http://$DNS:31112
```

* Download your `kubeconfig` file from the Civo dashboard.

* Now set the `KUBECONFIG` environment variable, so that you point at your new cluster:

```
export KUBECONFIG=$HOME/Downloads/config-file.yaml
```

### Find your generated password

Now retrieve your password and save it into `password.txt` with the following command:

```
echo $(kubectl get secret -n openfaas basic-auth -o jsonpath="{.data.basic-auth-password}" | base64 --decode) > password.txt 

echo Your admin password is: $(cat password.txt)
```

### Use the CLI to log in

Now install the [faas-cli](http://github.com/openfaas/faas-cli) and log in:

```
cat password.txt | faas-cli login --username admin --password-stdin
```

### Deploy a test function

```
faas-cli store list

# Find one you like

faas-cli store deploy nodeinfo

# List your functions

faas-cli list --verbose

# Check when the function is ready

faas-cli describe nodeinfo

Name:                nodeinfo
Status:              Ready

# Invoke the function using the URL given above, or via `faas-cli invoke`

echo | faas-cli invoke nodeinfo
echo -n "verbose" | faas-cli invoke nodeinfo
```

### Access the UI

You can now use the DNS entry you found earlier in a web-browser to access your dashboard.

```sh
echo $OPENFAAS_URL
```

## Next steps

* Read the docs: [Deploy SSL with LetsEncrypt to enable HTTPS](https://docs.openfaas.com/reference/ssl/kubernetes-with-cert-manager/)
* Run a lab: [Try the OpenFaaS workshop](https://github.com/openfaas/workshop)
* Join the [OpenFaaS Slack](https://slack.openfaas.io/)

