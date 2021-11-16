# Ketch
## Getting Started
To leverage Ketch, you will need to install the Ketch CLI on your local machine.

```
curl -s https://raw.githubusercontent.com/shipa-corp/ketch/main/install.sh | bash
```

### Wiring
Ketch does not require an Ingress Controller to be installed. Though to deploy an Applicaiton
through Ketch will require an Ingress Controller. Ketch uses the Ingress Controller address
to generate the deployed application's DNS name that can be used to access the application.

Users can install Traefik (Version 2.x+) or Istio on their cluster and use its address when
creating a Ketch Framework. 

For Example here is how to install Traefik 2.x+ with Helm and then get the external Ingress IP address for 
your Civo CLuster. 

```
#Install Traefik
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik

#Get External IP
kubectl get services
```

e.g 212.2.246.174

### Framework
Ketch works on the concept of Frameworks (logical defination areas).
With your  external address, you can create a Framework with the Ketch CLI.
Here is an example creating a "dev" Framework.

```
ketch framework add dev --ingress-service-endpoint 212.2.246.174 --ingress-type traefik
```

### Deploy
Can leverage Ketch to deploy your existing image. Here is a sample bulletin board app. 

```
ketch app deploy bulletinboard -k dev -i docker.io/shipasoftware/bulletinboard:1.0
```

### Access the App
Can run a Ketch Command to get the endpoint of your newly deployed app under Addresses.

```
ketch app list
```

e.g  http://bulletinboard.212.2.246.174.shipa.cloud

Congratulations on your first Ketch deployment!

## Futher Information
Here are a few pieces for further information.

- [CD Foundation Getting Started with Ketch](https://cd.foundation/blog/2021/10/20/getting-started-with-ketch-and-kubernetes-for-a-better-developer-experience/)
- [Ketch Docs](https://learn.theketch.io/docs/overview)
- [Ketch GitHub](https://github.com/theketchio/ketch)
