# Contributing

Glad to see that you want to automate your application update.
This both helps you and the CIVO community to benefits from the latest version published.

We assume that your application has:

* The file `install.sh` using a specific Helm chart version which has to be automatically updated when a new Helm chart version is available
* The file "manifest.yaml" has a key "version" set to the latest application installed in your Helm Chart which also need to be update automatically.

## Manifest

An Updatecli manifests is composed of the following sections:

* sources
* conditions
* targets
* actions
* scms

IMPORTANT: The order doesn't matter as Updatecli read the manifest and then enforce the state defined by the manifest.

### Sources

The `sources` section defines where the information, that we monitor, is coming from.
In the context of the CIVO marketplace, it is usually:

* A source ID named "chart" of kind [helmchart](https://www.updatecli.io/docs/plugins/resource/helm_chart/) to bump the install.sh to the latest helm chart version
* A source ID named "app" of kind [githubrelease](https://www.updatecli.io/docs/plugins/resource/github_release/) to bump the manifest.yaml to the latest application version.

### Targets

The `targets` section defines the files that we need to automatically bump when needed.
In the context of the CIVO marketplace, it is usually:

* A target ID named "manifest" of kind [yaml](https://www.updatecli.io/docs/plugins/resource/yaml/) to automatically bump the file named  "manifest.yaml" if the key "version" is not set to the value retrieved by the source ID "app". 
* A target ID named "install" of kind [file](https://www.updatecli.io/docs/plugins/resource/yaml/) to automatically bump the file named "install.sh" using a regular expression.

### Scms

The `scms` sections defines the git repository we want to interact with. We need at least the scm id named "kubernetes-marketplace" which is used to push changes and open pullrequest. That scm id is templated so we can easily override the values using the file "values.yaml". 

### Actions

The `actions` sections defines the actions to execute if a change is detected in a target.
In the context of the CIVO marketplace, it is usually:

* An action id "kubernetes-marketplace" of kind [github/pullrequest](https://www.updatecli.io/docs/plugins/actions/github/), that will open a pullrequest on the CIVO marketplace, using the git repository defines in the scms section.


## Going further

This contributing document focus on adding Updatecli manifest for the CIVO marketplace, but depending on your project you may need to customize your update scenario.

Feel free to look at:
* Look for more update scenario on www.updatecli.io. 
* Provide feedback on https://github.com/updatecli/updatecli
* Ask question on https://matrix.to/#/#Updatecli_community:gitter.im



