## The Istio service mesh

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

### Access Istio Ingress Gateway

The installation creates an *Ingress* for the `istio-ingressgateway`. You can use that to access the Istio service mesh applications.

Run the following command to get Istio Ingress Gateway URL:

```shell
export ISTIO_GATEWAY_URL=$(kubectl get ing -n istio-system istio-ingressgateway-ingress -o=jsonpath='{.spec.rules[0].host}')
curl -I $ISTIO_GATEWAY_URL 
```

The command should show an output with HTTP 502, as currently no application is part of the Istio Service mesh.

```text
HTTP/1.1 502 Bad Gateway
Vary: Accept-Encoding
Date: Wed, 26 May 2021 12:39:35 GMT
Content-Length: 11
Content-Type: text/plain; charset=utf-8
```

Label the `default` namespace for Istio automatic sidecar injection:

```shell
kubectl label namespace default istio-injection=enabled
```

Now deploy [Deploy Bookinfo Application](https://istio.io/latest/docs/setup/getting-started/#bookinfo)

Once successfully deployed, [expose the application](https://istio.io/latest/docs/setup/getting-started/#bookinfo) to outside world

After you have exposed the application to outside world, try accessing it using the `$GATEWAY_URL`

```shell
curl -I $ISTIO_GATEWAY_URL/productpage
```
The curl should return you an HTTP 200

```text
HTTP/1.1 200 OK
Content-Length: 5179
Content-Type: text/html; charset=utf-8
Date: Wed, 26 May 2021 12:47:06 GMT
Server: istio-envoy
Vary: Accept-Encoding
X-Envoy-Upstream-Service-Time: 1029
```

(OR)

Opening the following url in the web browser should show you the sample book application landing page:

```shell
open "http://$ISTIO_GATEWAY_URL/productpage"
```

### Documentation

[Istio Documentation](https://istio.io/latest/docs/)
