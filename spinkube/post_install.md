Once you have installed spinkube, you should be able to create spin apps using the Customer resource. 

Try the sample app below 

Create your first application in the same spin-operator namespace that the operator is running:
`kubectl apply -f https://raw.githubusercontent.com/spinkube/spin-operator/main/config/samples/simple.yaml`

Forward a local port to the application pod so that it can be reached:
`kubectl port-forward svc/simple-spinapp 8083:80`

In a different terminal window, make a request to the application:
`curl localhost:8083/hello`

You should see:

`Hello world from Spin!`

Please note: This application only supports Talos-based Kubernetes clusters.
