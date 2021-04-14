## Linkerd service mesh

### External access

The Linkerd dashboard is not available to the public by default, but if you install Linkerd-viz and the linkerd client utility, you can open a tunnel to it easily:

```
curl -sL https://run.linkerd.io/install | sh
# or brew install linkerd on macOS

linkerd viz dashboard
```

This will automatically open the Linkerd dashboard in your browser, or you can visit http://127.0.0.1:50750

### Usage instructions

Linkerd provides instructions on [installing a demo application](https://linkerd.io/2/getting-started/#step-5-install-the-demo-app) that uses Linkerd on their site. It's worth a read and a play with service meshes to get the hang of how/when they are of benefit.
