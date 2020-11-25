## Using LitmusChaos Operator 

- Verify that the chaos operator and chaos CRDs are successfully installed

  ```
  $ kubectl get pods -n litmus
  NAME                                 READY   STATUS    RESTARTS   AGE
  chaos-operator-ce-56449c7d75-lt8jc   1/1     Running   0          90s
  ```

  ```
  $ kubectl get crds | grep chaos

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


- Refer to the litmuschaos documentation for detailed steps on how you can execute different chaos experiments: https://docs.litmuschaos.io.
  You can also refer to this [blog](https://www.civo.com/learn/chaos-engineering-kubernetes-litmus) to get started with litmus on Civo Cloud.
