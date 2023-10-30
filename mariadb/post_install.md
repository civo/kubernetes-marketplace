## MariaDB - MySQL compatible database

### External access

By default external access to the MariaDB port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f mariadb-service.yaml` (or whatever you call the file containing the contents below) which will launch a [Civo Load Balancer](https://www.civo.com/load-balancers) (at an additional charge):

```
apiVersion: v1
kind: Service
metadata:
  name: mariadb-service
spec:
  type: LoadBalancer
  ports:
    - port: 3306
      targetPort: 3306
      protocol: TCP
  selector:
    app: mariadb
```

This will open up http://YOUR_CLUSTER_ID.k8s.civo.com:3306 to the whole world. You should lock this down in the [firewall](https://dashboard.civo.com/firewalls) automatically created in Civo for your Kubernetes cluster. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

You can use this application from within your cluster by just using the hostname `mariadb` and can create databases and users using the `root` access credentials above this message. For example, to create an application's database and user credentials and given that the `kubectx` and [Civo CLI](https://www.civo.com/docs/overview/civo-cli) are installed, with a Civo Kubernetes cluster called `my-cluster-name`:

```
$ civo k3s config my-cluster-name --save
$ kubectx my-cluster-name
$ kubectl run tmp-shell --generator=run-pod/v1 --rm -i \
  --tty --image alpine -- /bin/sh

/ # apk update
/ # apk add mariadb-client
/ # mysql -u root -pYOUR_ROOT_PASSWORD_HERE -h mariadb

mysql> CREATE DATABASE my_application;
mysql> GRANT ALL ON my_application.* to my_user identified
       by 'super-strong-password-here';
```
