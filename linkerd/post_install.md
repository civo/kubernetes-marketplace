## Linkerd service mesh

### External access

Depending on the plan you selected you may or may not have access to the Dashboard. as of Linkerd 2.10 the Linkerd dashboard has been moved into the Viz extension.

The Linkerd dashboard is not available to the public by default, but if you installed Linkerd-viz and the linkerd client utility, you can open a tunnel to it easily:

```bash
linkerd viz dashboard
```

This will automatically open the Linkerd dashboard in your browser, or you can visit http://127.0.0.1:50750

### Usage instructions

Linkerd provides instructions on [installing a demo application](https://linkerd.io/2/getting-started/#step-5-install-the-demo-app) that uses Linkerd on their site. It's worth a read and a play with service meshes to get the hang of how/when they are of benefit.

Linkerd's minimal install is comfortable on a cluster as small as a single node extra small instance. A single node cluster of size small or greater can accomodate installing Linkerd and any extensions you like.
