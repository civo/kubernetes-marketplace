## Linkerd Jaeger Extension

### External access

The Linkerd jaeger dashboard is not available to the public by default, you can open a tunnel to it easily:

```
curl -sL https://run.linkerd.io/install | sh
# or brew install linkerd on macOS

linkerd jaeger dashboard
```

This will automatically open the Linkerd jaeger dashboard in your browser, or you can visit http://127.0.0.1:16686

### Usage instructions

Linkerd provides instructions on [getting started with tracing in Linkerd](https://linkerd.io/2.10/tasks/distributed-tracing/).
