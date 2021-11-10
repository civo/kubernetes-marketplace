## GitLab
GitLab is The DevOps Platform, delivered as a single application. This makes GitLab unique and creates a streamlined software workflow, unlocking your organization from the constraints of a pieced together toolchain. Learn how GitLab offers unmatched visibility and higher levels of efficiency in a single application across the DevOps lifecycle.


## Obtain access

You can get started with the [GitLab Documentation](https://docs.gitlab.com/ee/).

You can access the GitLab instance by visiting the domain specified during installation. The default domain would be `gitlab.$CLLUSTER_ID.k8s.civo.com`. The initial login user is `root` and password you can get from following command 

```
kubectl get secret -n gitlab gitlab-gitlab-initial-root-password --namespace gitlab -ojsonpath='{.data.password}' | base64 --decode ; echo

```


