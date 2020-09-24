## Using kube-hunter

### Usage instruction

Here we run kube-hunter in a pod within the cluster. This gives an indication of how exposed your cluster would be in the event that one of your application pods is compromised (through a software vulnerability, for example).

Check the logs of the kube-hunter pod to see the results.
```
# Get the pod name
$ kubectl -n kube-hunter describe job kube-hunter
# Check the logs
$ kubectl -n kube-hunter logs <pod name>
```

When the kube-hunter reports an issue, it will show its VID (Vulnerability ID) in the pod logs. You can further explore about that vulnerability by putting the VID on [this site](https://aquasecurity.github.io/kube-hunter/).

If you want to run kube-hunter on daily basis, feel free to convert it to a [cronjob](https://kubernetes.io/docs/concepts/workloads/controllers/cron-jobs/).

To know more, check this [official guide](https://github.com/aquasecurity/kube-hunter).
