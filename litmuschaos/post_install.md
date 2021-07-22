## Verify LitmusChaos Control Plane Installation

- Verify that the litmus control plane (portal) deployments (server, frontend, mongodb)are installed 
and running succesfully. 

```
kubectl get pods -n litmus
```

Expected Output: 

```
chaos-litmus-portal-frontend-ff8b554dc-q5rl4   1/1     Running   0          2m6s
chaos-litmus-portal-mongo-6764cfdd59-c9r56     1/1     Running   0          2m6s
chaos-litmus-portal-server-5ffbccbfff-dknv8    2/2     Running   0          2m6s
```

- Refer to the [litmuschaos 2.0 beta documentation](https://litmusdocs-beta.netlify.app/docs/getstarted) for registration of chaos targets (cluster/namespaces) and construction of chaos workflows

- Refer to the [litmuschaos experiment documentation](https://docs.litmuschaos.io/docs/pod-delete/) for details on how you tune different chaos experiments within a chaos workflow. 

