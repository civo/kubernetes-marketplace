# Devtron

Devtron is a software delivery platform for kubernetes apps that helps you achieve advanced maturity in just a few weeks. It is built in a modular fashion, and comes with a Kubernetes dashboard as a base module and can be extended to provide a seamless Kubernetes native CI/CD with a 360-degree overview of k8s applications and clusters. Deploy on demand and enable faster triage on a web-based Dashboard Interface with integrated SecOps.

# Getting started

To ensure that Devtron is up and running, you can use `kubectl get pods -ndevtroncd` to make sure all the pods are running. If some pods are in CrashLoopBackOff, or not in a running state, wait for a few minutes. It can take up to 5 minutes for Devtron to be fully running.

After you have installed Devtron from the Civo Marketplace, and it is ready to use, you will have to do two additional steps.

**Step 1: Get the Dashboard URL**
    For this, you can either copy the DNS link from the Civo dashboard or enter the following command in your terminal

```
kubectl get svc -n devtroncd devtron-service -o jsonpath='{.status.loadBalancer.ingress}'
```

![](https://i.imgur.com/ClnMpGK.png)

You will get a similar result to the screenshot. Copy the `hostname` and paste it into your browser.

**Step 2. Obtain the Credentials**

You will require the admin credentials to log into the dashboard. To get the credentials, please enter the following command in your terminal
 
 ``` 
kubectl -n devtroncd get secret devtron-secret \
-o jsonpath='{.data.ADMIN_PASSWORD}' | base64 -d
```
This will give you the admin credentials which you can use to log into the dashboard.

You should now be able to see the Devtron Dashboard as shown in the picture below.

![](https://i.imgur.com/54Ee2e0.png) 

# Additional Resources

Dive into the world of Kubernetes and Platform Engineering with Devtron.

GitHub: https://github.com/devtron-labs/devtron <br/>
Video: https://devtron.ai/video-home <br/>
Documentation: https://docs.devtron.ai/ <br/>
e-Book: https://devtron.ai/ebook-home <br/>
Youtube: https://www.youtube.com/@devtronL <br/>
Blog: https://devtron.ai/blog/ <br/>
Webinars: https://devtron.ai/webinars-home <br/>


