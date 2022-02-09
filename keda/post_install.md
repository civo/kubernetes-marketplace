## KEDA

KEDA is a Kubernetes-based Event Driven Autoscaler. With KEDA, you can drive the scaling of any container in Kubernetes based on the number of events needing to be processed.

KEDA is a single-purpose and lightweight component that can be added into any Kubernetes cluster. KEDA works alongside standard Kubernetes components like the Horizontal Pod Autoscaler and can extend functionality without overwriting or duplication. With KEDA you can explicitly map the apps you want to use event-driven scale, with other apps continuing to function. This makes KEDA a flexible and safe option to run alongside any number of any other Kubernetes applications or frameworks.

### Features

- Event-driven 
- Autoscaling Made Simple
- Built-in Scalers
- Multiple Workload Types
- Vendor-Agnostic
- Azure Functions Support

### Example 

Example from [Scaling Kubernetes: Intro to Kubernetes-based event-driven autoscaling (KEDA)](https://cloudblogs.microsoft.com/opensource/2020/05/12/scaling-kubernetes-keda-intro-kubernetes-based-event-driven-autoscaling/)

1. Create a Deployment (or a Job): 
This is simply the application you want KEDA to scale based on a scale trigger. Apart from that, it is completely independent.


2. Create a ScaledObject: This is the custom resource definition, with which you can define the source of metrics, as well as autoscaling criteria.

Once this is done, KEDA will start collecting information from the event source and drive the autoscaling accordingly. Here is an example of a `ScaledObject`, which defines how to autoscale a Redis list consumer called processor that is running in a cluster as a Kubernetes `Deployment`.

```yaml
apiVersion: keda.sh/v1alpha1
kind: ScaledObject
metadata:
  name: redis-scaledobject
  namespace: default
  labels:
    deploymentName: processor
spec:
  scaleTargetRef:
    deploymentName: processor
  pollingInterval: 20
  cooldownPeriod:  200
  minReplicaCount: 0
  maxReplicaCount: 50
  triggers:
  - type: redis
    metadata:
      address: redis:6739
      listName: jobs
      listLength: "20"
    authenticationRef:
      name: redis-auth-secret
```
Notice that the ScaledObject definition is largely divided into two parts: one that is generic and the other one that is specific to the event source (Redis has been used as an example).

The generic parameters consist of:

- `scaleTargetRef.deploymentName`: the name of the Deployment you want to autoscale
- `minReplicaCount`: minimum number of replicas that KEDA will scale the deployment down to. You can scale down to zero, but it’s possible to use any other value
- `cooldownPeriod`: the period to wait after the last trigger reported active before scaling the deployment back to `minReplicaCount`
- `pollingInterval`: the interval to check each trigger on
- `maxReplicaCount`: the maximum number of replicas that KEDA will scale the deployment out to

The event source or trigger specific parameters are:

- `triggers.type`: the event source being used (e.g., redis)
- `triggers.metadata`: attributes that differ from trigger to trigger (e.g., in case of redis, its address, listName, and listLength)
- `triggers.authenticationRef`: allows you to refer to a TriggerAuthentication object, which is another KEDA-specific object to capture the authentication mechanism of an event source


### More details

See https://keda.sh/docs/2.6/concepts/ for the usage of the different event sources and scalers.
