## Using netdata

### Usage instruction

We use `kubectl port-forward` to expose netdata UI.
```
kubectl port-forward deployment/netdata-parent -n netdata 19999:19999
```
Now access the netdata UI at `http://localhost:19999`

To know more, check the [official guide](https://learn.netdata.cloud/docs/netdata-agent/installation/kubernetes). Also check their [github README](https://github.com/netdata/netdata).
