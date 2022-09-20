Civo cluster autoscaler is part of the official Kubernetes cluster autoscaler repository that will automatically adjust the size of the Kubernetes cluster when one of the following conditions is true:

- there are pods that failed to run in the cluster due to insufficient resources.
- there are nodes in the cluster that have been underutilized for an extended period of time and their pods can be placed on other existing nodes.
