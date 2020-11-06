## NextCLoud - The self-hosted productivity platform

### Usage instructions

### DB Setup
Before running the setup wizard you will need to create a database and user account in mariadb

```
$ kubectl exec -it svc/mariadb -- /bin/sh

# mysql -u root -p
Enter password: YOUR_ROOT_PASSWORD_HERE

MariaDB [(none)]> CREATE DATABASE nextcloud_db;
MariaDB [(none)]> CREATE USER nc_user identified by 'strong-password';
MariaDB [(none)]> GRANT ALL ON nextcloud_db.* TO nc_user;
```

### External Access

An ingress is automatically created during the application install. A certificate using cert manager and lets-encrypt is also applied automatically and registered against your Civo email address and the generated domain name.

You can access this (replacing the clusterID with your own) via: https://nextcloud.YOUR_CLUSTER_ID.k8s.civo.com

###
You should now see the setup page where you can enter the database details created above.
> Note the database server is called mariadb




