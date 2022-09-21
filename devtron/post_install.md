# Getting started

After you have selected Devtron from the Civo Marketplace, you will have to do two additional tasks.
1. Get the Dashboard URL.
    For this, you can either copy the DNS link from the Civo dashboard or enter the following command in your terminal
    ```
    kubectl get svc -n devtroncd devtron-service -o jsonpath='{.status.loadBalancer.ingress}'
    ```

![](https://i.imgur.com/ClnMpGK.png)

    You will get a similar result to the screenshot. Copy the `hostname` and paste it into your browser.

2. You will require the admin credentials to log into the dashboard. To get them, enter the following command in your terminal
 
 ``` 
kubectl -n devtroncd get secret devtron-secret \
-o jsonpath='{.data.ACD_PASSWORD}' | base64 -d 
```

You should now be able to see the Devtron Dashboard as shown in the picture below.

![](https://i.imgur.com/d5jtTq6.png)

The dashboard is quite intuitive to use. If you have any difficulties, please refer to our [documentation](https://docs.devtron.ai/), or reach out to us on our [discord server](https://discord.com/invite/jsRG5qx2gp) and we will be happy to help. 

