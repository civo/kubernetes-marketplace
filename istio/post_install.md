## The Istio Service Mesh

[Istio](https://istio.io)  addresses the challenges developers and operators face with a distributed or microservices architecture. Whether you're building from scratch or migrating existing applications to cloud native, Istio can help.

### Install istioctl

Download and Install latest `istioctl` in your local machine:

```shell
curl -L https://istio.io/downloadIstio | sh -
ISTIO_DIR=$(find . -name istio*)
export PATH=$ISTIO_DIR/bin:$PATH
cd $ISTIO_DIR
```

### Get started

#### Enable Istio Service Mesh on `default` Namespace

Label the `default` namespace for Istio automatic sidecar injection:

```shell
kubectl label namespace default istio.io/rev=1-10-1
```

__NOTE__: 
The revision value corresponds to the Istio version that was installed. The example above shows Istio v1.10.1 was installed. For example if your use 1.8.6 then the `istio.io/rev` will be `istio.io/rev=1-8-6`

#### Deploy BookInfo Application

Now deploy [Deploy Bookinfo Application](https://istio.io/latest/docs/setup/getting-started/#bookinfo)

Once successfully deployed, [expose the application](https://istio.io/latest/docs/setup/getting-started/#ip) to outside world

After you have exposed the application to outside world, try accessing it using the **$GATEWAY_IP**.

Run the following command to get Istio Ingress IP:

```shell
export GATEWAY_IP=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
```

Accessing the application,

```shell
curl -I $GATEWAY_IP/productpage
```

The curl should return a response as shown below:

```text
HTTP/1.1 200 OK
content-type: text/html; charset=utf-8
content-length: 5179
server: istio-envoy
date: Thu, 10 Jun 2021 06:51:29 GMT
x-envoy-upstream-service-time: 107
```

(OR)

Opening the following url in the web browser, to see the sample book application landing page:

```shell
"http://$GATEWAY_IP/productpage"
```

### Documentation

[Istio Documentation](https://istio.io/latest/docs/)

### Further reading

* A [Collection of Istio and Civo tutorials](https://www.civo.com/learn/categories/istio)
* Example of Civo and Argo CD use cases:
   * [Getting started with Istio Service Mesh](https://www.civo.com/learn/istio-service-mesh-introduction)
   * [Traffic management and deployment strategies with Istio](https://www.civo.com/learn/istio-traffic-management)
   * [Istio Security Essentials: Authorization, Headers, and mTLS](https://www.civo.com/learn/istio-security)
   * [Installing an Apache Kafka cluster on Kubernetes using Strimzi and GitOps](https://www.civo.com/learn/installing-an-apache-kafka-cluster-on-kubernetes-using-strimzi-and-gitops)

