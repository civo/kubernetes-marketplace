## Kyverno

Kyverno is a policy engine designed for Kubernetes. With Kyverno, policies are managed as 
Kubernetes resources and no new language is required to write policies. This allows using 
familiar tools such as kubectl, git, and kustomize to manage policies. Kyverno policies 
can validate, mutate, and generate Kubernetes resources. The Kyverno CLI can be used to 
test policies and validate resources as part of a CI/CD pipeline.

Kyverno (Greek for “govern”) is a policy engine designed specifically for Kubernetes. Some of its many features include:

* policies as Kubernetes resources (no new language to learn!)
* validate, mutate, or generate any resource
* match resources using label selectors and wildcards
* validate and mutate using overlays (like Kustomize!)
* synchronize configurations across namespaces
* block non-conformant resources using admission controls, or report policy violations
* test policies and validate resources using the Kyverno CLI, in your CI/CD pipeline, before applying to your cluster
* manage policies as code using familiar tools like git and kustomize