# Civo K3s Marketplace

## Introduction
[Civo.com](https://www.civo.com) is introducing the world's first managed K3s service and the marketplace will be provided from this repository. Feel free to fork it and submit a pull request to add any software and we'll consider including it in our marketplace (if you like, raise an [issue](https://github.com/civo/k3s-marketplace/issues) first to discuss the proposal).

**STATUS:** This project is currently under active development and maintenance.

## Table of contents
- [Introduction](#introduction)
- [Using](#using) 
- [Writing](#writing)
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

There are three parts to a marketplace application - a manifest, the Kubernetes resources configuration itself and a square aspect ratio PNG format logo. Each marketplace application is in a separate top level folder in this repository. The Kubernetes resources configuration should be called `app.yaml` and can be multiple resources separated by `---`. The logo should be called `logo.png`.

However, to control the listing of your application in the marketplace, `manifest.yaml` is where the magic happens. Here's an example of a manifest.yaml:

```
name: Foo
version: v0.1.0
dependencies:
  - bar
maintainer: @civocloud
description: Foo is a lightweight and reliable widget maker from Example Ltd.
extra_information: |
  ## Using Foo widgets

  Create a widget by doing...
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
* serverless

Any category used in this field outside of those values will be removed when we accept any changes and replaced with one of those. If you want an additional category, please propose it in a [GitHub issue](https://github.com/civo/k3s-marketplace/issues).

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
