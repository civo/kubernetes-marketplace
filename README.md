# Civo K3s Marketplace

[![CircleCI](https://circleci.com/gh/civo/k3s-marketplace.svg?style=svg)](https://circleci.com/gh/civo/k3s-marketplace)

## Introduction
[Civo.com](https://www.civo.com) is introducing the world's first managed K3s service and the marketplace will be provided from this repository. Feel free to fork it and submit a pull request to add any software and we'll consider including it in our marketplace (if you like, raise an [issue](https://github.com/civo/k3s-marketplace/issues) first to discuss the proposal).

**STATUS:** This project is currently under active development and maintenance.

## Table of contents
- [Introduction](#introduction)
- [Using](#using) 
- [Writing](#writing)
- [Customising](#customising)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Using

Once an application is part of the marketplace, you can install it using the GUI on Civo.com or by using the [Civo CLI](https://github.com/civo/cli) with a command line:

```
civo k8s create my-cluster --app=longhorn,minio

# or

civo k8s add-app my-cluster longhorn
```

## Writing

There are two minimum parts to a marketplace application - a `manifest.yaml`, and a square aspect ratio `logo.png` no larger than 512x512 or 20KB. Each marketplace application is in a separate top level folder in this repository. 

Then there are two options for how to install the application - a single  Kubernetes resources configuration file called `app.yaml` (which can be multiple resources separated by `---`) or a script called `install.sh`. You can supply both items, if so the `app.yaml` will be applied first and then the `install.sh` will run.

The `install.sh` if present will be executed on the master using `bash` as non-privileged user that has passwordless `sudo` permission and has `kubectl` access to the cluster. We envisage that `install.sh` script usage should be rare and we will be strictly monitoring what is in them, and *NO* downloading of external resources will be acceptable here (no `curl https://... | sudo sh` sort of functionality)

A final optional file is the `post_install.md` which the user will be able to view in the web UI to see additional instructions on how to use the application. It's recommended to keep this short and succinct, if you need to manage LOTS of content, then please create a [community learn guide](https://www.civo.com/learn/creating-a-learn-guide) and link to it from within the `post_install.md`.

To control the listing of your application in the marketplace, `manifest.yaml` is where the magic happens. Here's an example of a manifest.yaml:

```
name: Foo
version: v0.1.0
dependencies:
  - bar
maintainer: @civocloud
description: Foo is a lightweight and reliable widget maker from Example Ltd.
url: https://example.com/foo
category: management
```

The `name` is displayed in the web interface alongside the `logo.png`, and is searchable when you're installing marketplace applications from the CLI. The `version` is the version of the software being installed NOT the version of the marketplace configuration. If you want to include that, use an additional `-r1` or something after the version number. The `dependencies` are the names (can be lower case and part of the name) of any other marketplace applications that are needed by this application.

The `maintainer` field can either be an email address (e.g. `hello@civo.com`) or a Twitter username (e.g. `@civocloud`) and isn't displayed on the site, but is used for us to determine who to contact if there are any problems with it.

The `description` is used when displaying all of the applications, and is limited to a single line of up to 250 characters (any line breaks, HTML tags, etc will be removed). `extra_information` is displayed to the user on their cluster page after installing the application, so should contain usage or access instructions.

The `url` is a link to where users can read more about it. This is shortened when displayed on Civo.com to be just the domain name with any `www.` removed.

Finally the `category` can be one of a small list of categories for applications, these are maintained by Civo. The current list is:

* database
* storage
* monitoring
* management
* architecture

Any category used in this field outside of those values will be removed when we accept any changes and replaced with one of those. If you want an additional category, please propose it in a [GitHub issue](https://github.com/civo/k3s-marketplace/issues).

## Customising

Applications support customisation through a simple mechanism. This is a user defined set of variables that are then replaced within the `app.yaml` (prefixed with a `$`) or injected as ENVironment variables when executing `install.sh`). So for example a configuration of `USERNAME` will have the string `$USERNAME` replaced in `app.yaml` with the value or will be available as `ENV[USERNAME]`.

The applications can't ask the user for these values, so they must be either a preconfigured value (to keep the `app.yaml` and Civo-specific configuration separate) or one of a range of special values that Civo will inject:

<dl>
  <dt>CIVO:ALPHANUMERIC(num)</dt>
  <dd>A random string of alphanumeric characters <code>num</code> long</dd>
  <dt>CIVO:WORDS(num)</dt>
  <dd>A combination of <code>num</code> random words, separated by <code>-</code> for use as a readable name</dd>
  <dt>CIVO:CLUSTER_NAME</dt>
  <dd>The name of your Kubernetes cluster</dd>
  <dt>CIVO:EMAIL_ADDRESS</dt>
  <dd>The email address of your Civo account</dd>
  <dt>CIVO:MASTER_IP</dt>
  <dd>The public IP address of your Kubernetes cluster's master</dd>
</dl>

**Note:** For `CIVO:ALPHANUMERIC(num)` and `CIVO:WORDS(num)` you can also suffix `:BASE64` (e.g. `CIVO:ALPHANUMERIC(10):BASE64`) to have Civo automatically encode the random values to Base 64 before inserting them in the templates (but the non-Base 64 version is kept to present to the user as a readable/copyable value).

These are specified in the `manifest.yaml` like this:

```
configuration:
  ACCESS_KEY:
    label: "Access key"
    value: "CIVO:ALPHANUMERIC(10)"
```

Another way of customising applications is to provide plans which will be injected in the same way as the values above, but the UI will provide a choice for which plan to install. These are specified in the `manifest.yaml` like this:

```
plans:
  - label: "5GB"
    configuration:
      APP_SIZE_GB: 
        value: 5
  - label: "10GB"
    configuration:
      APP_SIZE_GB: 
        value: 10
```

There's no label for the configuration items in `plans` because they are just used internally to configure the specifics of the installation (e.g. disk size usage, number of threads, RAM limits, etc) so aren't displayed to the user, unless you give them a label (if the user really should see what these are configured to).

## Testing

Testing a marketplace application during development is easy, use the Civo CLI to launch a cluster, then simply apply the app.yaml without any other options, for example:

```
# Create a cluster with any prerequisites
civo k8s create my-cluster --app=longhorn --save --wait

# Then apply your app.yaml
kubectl apply -f app.yaml
```

Then you can test it and ensure the app.yaml is standalone and working.

## Contributing

To contribute an application or a fix for an application to Civo, please fork our [marketplace repository](https://github.com/civo/k3s-marketplace) and submit a pull request. In the pull request please confirm that you're OK for the marketplace application to be distributed by us under the MIT License.

## License

The marketplace is provided by Civo Ltd as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT), however software installed as part of a marketplace app may be licensed under another licence.
