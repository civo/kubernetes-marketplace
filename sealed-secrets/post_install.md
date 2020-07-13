## sealed-secrets -  a Kubernetes controller and tool for one-way encrypted Secrets 

### Client installation

Install client-side tool from [0.12.4 release page](https://github.com/bitnami-labs/sealed-secrets/releases/tag/v0.12.4)

### Usage

```sh
# Create a json/yaml-encoded Secret somehow:
# (note use of `--dry-run` - this is just a local file!)
$ echo -n bar | kubectl create secret generic mysecret --dry-run --from-file=foo=/dev/stdin -o json >mysecret.json

# This is the important bit:
# (note default format is json!)
$ kubeseal <mysecret.json >mysealedsecret.json

# mysealedsecret.json is safe to upload to github, post to twitter,
# etc.  Eventually:
$ kubectl create -f mysealedsecret.json

# Profit!
$ kubectl get secret mysecret
```

* Official [sealed-secret docs](https://github.com/bitnami-labs/sealed-secrets#overview)
