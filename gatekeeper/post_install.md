## OPA Gatekeeper

Gatekeeper is a Policy Controller for Kubernetes

### Gatekeeper is different from OPA

Compared to using [OPA with its sidecar kube-mgmt](https://www.openpolicyagent.org/docs/kubernetes-admission-control.html) (aka Gatekeeper v1.0), Gatekeeper introduces the following functionality:

- An extensible, parameterized policy library
- Native Kubernetes CRDs for instantiating the policy library (aka "constraints")
- Native Kubernetes CRDs for extending the policy library (aka "constraint templates")
- Audit functionality

### To check out how to use Gatekeeper head over [here](https://open-policy-agent.github.io/gatekeeper/website/docs/howto)
