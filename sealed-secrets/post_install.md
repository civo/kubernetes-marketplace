## sealed-secrets -  a Kubernetes controller and tool for one-way encrypted Secrets 

### Client installation

Install the kubeseal CLI by downloading the binary from [sealed-secrets/releases](https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.26.2)

### Usage

```sh
# Create a json/yaml-encoded Secret somehow:
# (note use of `--dry-run` - this is just a local file!)
echo -n bar | kubectl create secret generic mysecret --dry-run=client --from-file=foo=/dev/stdin -o json >mysecret.json

# This is the important bit:
# (note default format is json!)
kubeseal -f mysecret.json -w mysealedsecret.json

# At this point mysealedsecret.json is safe to upload to Github,
# post on Twitter, etc.

# Eventually:
kubectl create -f mysealedsecret.json

# Profit!
kubectl get secret mysecret
```

* Official [sealed-secret docs](https://github.com/bitnami-labs/sealed-secrets#overview)
