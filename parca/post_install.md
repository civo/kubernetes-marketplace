## Post Install

- Port forward to the Parca pod
```sh
kubectl port-forward -n parca service/parca 7070
```
- Open http://localhost:7070 to access Parca
