# Updatecli

Updatecli is a declarative dependency management tool. The application is available as a command line compatible with Linux/macOS/Windows. Updatecli is designed to work the same way, both from a local machine and a CI environment.

## Requirements

In order to use this project, you need both Updatecli installed, and a GitHub PAT for interacting with GitHub.

### Updatecli
It can easily be installed using Homebrew by running the two following commands:

```
brew tap updatecli/updatecli
brew install updatecli
```

Additional installation instructions are available at [www.updatecli.io](https://www.updatecli.io/docs/prologue/installation)

### GitHub PAT

The GitHub PAT, is the token used to authenticate with the GitHub api. More information [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

The PAT must have enough permission for pushing git changes to a new working branch, and to open pullrequests.

## Description

An Updatecli typical project has:

* A directory named `updatecli.d` that contains all Updatecli manifests. While the directory `updatecli.d` is not mandatory, it is used by IDE(s) to correctly load the Updatecli jsonshema used for validation and auto-completion. This simplifies writing the Updatecli custom DSL.

* A file named `values.yaml`. This file allows to customize Updatecli manifest. In the context of this project, we use it to quickly override git repository parameters such as the git repository we want to update.

```
├── README.md
├── updatecli.d
│   ├── argocd.yaml
│   ├── cert-manager.yaml
│   ├── epinio.yaml
│   ├── keda.yaml
│   ├── rancher.yaml
│   └── <your_manifest>.yaml
└── values.yaml
```

## Howto

### Run Updatecli in dry-run mode

```
export UPDATECLI_GITHUB_ACTOR="<your Github username>"
export UPDATECLI_GITHUB_TOKEN="<your GitHub personal access token>"
updatecli diff --config updatecli.d --values values.yaml
```

* `--config` can accept either a specific file or a directory containing manifest.

### Run Updatecli in apply mode

IMPORTANT: You can easily test on your personal fork by providing a different `values.yaml` with your specific parameters.

```
export UPDATECLI_GITHUB_ACTOR="<your Github username>"
export UPDATECLI_GITHUB_TOKEN="<your GitHub personal access token>"
updatecli apply --config updatecli.d --values values.yaml
```

* `--config` can accept either a specific file or a directory containing manifest.
