## MariaDB - MySQL compatible database

### External access

By default external access to the MariaDB port isn't available. This is easily changed by applying the following YAML to your cluster with `kubectl apply -f mariadb-service.yaml` (or whatever you call the file containing the contents below):

```
apiVersion: v1
kind: Service
metadata:
  name: mariadb-service
  namespace: mariadb
spec:
  type: LoadBalancer
  ports:
    - port: 3306
      targetPort: 3306
      protocol: TCP
  selector:
    app: mariadb
```

This will open up http://$LOADBALANCER:5432 to the whole world. You should lock this down in the firewall. Locking down the firewall will only affect access from OUTSIDE of your Kubernetes cluster, access from your applications within Kubernetes will not be affected.

### Usage instruction

You can use this application from within your cluster by just using the hostname `mariadb` and can create databases and users using the admin access credentials above this message. For example, to create an application's database and user credentials and given that the `kubectx` have a Kubernetescluster called `my-cluster-name` with KUBECONFIG variable exported with right config:
```
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
