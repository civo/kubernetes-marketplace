## Using LitmusChaos Operator 

- Verify that the chaos operator and chaos CRDs are successfully installed

  ```
  $ kubectl get pods -n litmus
  NAME                                 READY   STATUS    RESTARTS   AGE
  chaos-operator-ce-56449c7d75-lt8jc   1/1     Running   0          90s
  ```

  ```
  kubectl get crds | grep chaos

  chaosengines.litmuschaos.io       2020-11-06T14:23:59Z
  chaosexperiments.litmuschaos.io   2020-11-06T14:24:00Z
  chaosresults.litmuschaos.io       2020-11-06T14:24:00Z
  ```

  ```
  $ kubectl api-resources | grep chaos
  chaosengines                                   litmuschaos.io                 true         ChaosEngine
  chaosexperiments                               litmuschaos.io                 true         ChaosExperiment
  chaosresults                                   litmuschaos.io                 true         ChaosResult
  ```

- Install the desired ChaosExperiment CRs (say, pod-delete) from the [ChaosHub](https://hub.litmuschaos.io) 
  into the target namespace, i.e., the one where the application under test (AUT) resides. 
  These resources consist of a granular/low-level definition of chaos intent. Learn more about ChaosExperiments [here](https://docs.litmuschaos.io/docs/chaosexperiment/)

  *Note:* 

   - *Litmus supports an admin mode of operation, wherein all chaos operations can be carried out from 
   a single, centralized namespace, i.e., `litmus` without the need for the ChaosExperiment CRs to be installed 
   in the different namespaces where target apps reside. However, this would need a service account with cluster-wide
   scope to execute the experiments. To learn more, refer: [admin-mode](https://docs.litmuschaos.io/docs/admin-mode/) 
   docs*

   - *You could choose to install more individual experiments or install the full suite of generic kubernetes chaos 
   experiments [here](https://hub.litmuschaos.io/api/chaos/1.9.1?file=charts/generic/experiments.yaml)*
 

  In subsequent steps, replace the placeholders <YOUR_TARGET_NS> & <YOUR_APP_LABEL_KEY/VALUE> with the actual target namespace and 
  application label selector details, respectively.
 

  ```
  kubectl apply -f https://hub.litmuschaos.io/api/chaos/1.9.1?file=charts/generic/pod-delete/experiment.yaml -n <YOUR_TARGET_NS>
  ```
 
- Setup the service-account for running the pod-delete chaos experiment in the target namespace. If you are using admin-mode, 
  install the [litmus-admin](https://litmuschaos.github.io/litmus/litmus-admin-rbac.yaml) service account resources in the `litmus`
  namespace.


  ```yaml
  ---
  apiVersion: v1
  kind: ServiceAccount
  metadata:
    name: pod-delete-sa
    namespace: <YOUR_TARGET_NS>
    labels:
      name: pod-delete-sa
      app.kubernetes.io/part-of: litmus
  ---
  apiVersion: rbac.authorization.k8s.io/v1
  kind: Role
  metadata:
    name: pod-delete-sa
    namespace: <YOUR_TARGET_NS>
    labels:
      name: pod-delete-sa
      app.kubernetes.io/part-of: litmus
  rules:
  - apiGroups: ["","litmuschaos.io","batch","apps"]
    resources: ["pods","deployments","pods/log","events","jobs","chaosengines","chaosexperiments","chaosresults"]
    verbs: ["create","list","get","patch","update","delete","deletecollection"]
  ---
  apiVersion: rbac.authorization.k8s.io/v1
  kind: RoleBinding
  metadata:
    name: pod-delete-sa
    namespace: <YOUR_TARGET_NS>
    labels:
      name: pod-delete-sa
      app.kubernetes.io/part-of: litmus
  roleRef:
    apiGroup: rbac.authorization.k8s.io
    kind: Role
    name: pod-delete-sa
  subjects:
  - kind: ServiceAccount
    name: pod-delete-sa
    namespace: <YOUR_TARGET_NS>
  ```

- Prepare the ChaosEngine CR & apply on the cluster in the target namespace to trigger chaos. 
  The ChaosEngine is a user-facing CR which binds an application instance on the cluster with 
  a specific ChaosExperiment. It also provides a rich schema which helps you to specify run requirements 
  (custom entry/exit checks, monitoring flags, chaos resource cleanup poliy, pod-scheduling information, 
  resource requests/limits for chaos pods etc.,) that includes the serviceaccount used run the experiment. 
  Learn more about ChaosEngine [here](https://docs.litmuschaos.io/docs/chaosengine/)

  ```yaml
  apiVersion: litmuschaos.io/v1alpha1
  kind: ChaosEngine
  metadata:
    name: test-chaos
    namespace: <YOUR_TARGET_NS>
  spec:
    appinfo:
      ## provide app labels from the podTemplateSpec in the format key=value
      applabel: '<YOUR_APP_LABEL_KEY>=<YOUR_APP_LABEL_VALUE>'
    annotationCheck: 'false'
    engineState: 'active'
    chaosServiceAccount: pod-delete-sa
    monitoring: false
    jobCleanUpPolicy: 'retain'
    experiments:
      - name: pod-delete
        spec:
          components:
            env:
              # set chaos duration (in sec) as desired
              - name: TOTAL_CHAOS_DURATION
                value: '30'

              # set chaos interval (in sec) as desired
              - name: CHAOS_INTERVAL
                value: '10'
              
              # pod failures without '--force' & default terminationGracePeriodSeconds
              - name: FORCE
                value: 'false'
  ```


- Verify the experiment result/verdict using the ChaosResult CR

  ```
  kubectl describe chaosresult test-chaos-pod-delete -n <YOUR-TARGET-NS>
  ```

  By default, litmus verifies whether all filtered pods are in "Running" state & that all containers in each pod are "Ready" 
  as part of the experiment entry/exit checks. You can add custom criteria to define your steady state & thereby determine verdict 
  using the [Litmus Probes](https://docs.litmuschaos.io/docs/litmus-probe/).  

- For detailed documentation, visit: https://docs.litmuschaos.io
