# Wordpress

## Database Creation

You'll need to create a user and a database in MariaDB before you can configure your Wordpress.

```
$ kubectl exec -it svc/mariadb -- /bin/sh

# mysql -u root -p
Enter password: YOUR_ROOT_PASSWORD_HERE

MariaDB [(none)]> CREATE DATABASE wordpress_db;
MariaDB [(none)]> CREATE USER wordpress_user identified by 'strong-password';
MariaDB [(none)]> GRANT ALL ON wordpress_db.* TO wordpress_user;
```
## Wordpress Wizard Setup

The first time you access to your Wordpress a wizard setup will be loaded. In the first step you will select the language, and then you will be asked for your database connection information.

Based on the database creation example above, the fields would be filled like this:

* **Database Name:** *wordpress_db*
* **Username:** *wordpress_user*
* **Password:** *strong-password*
* **Database Host:** *mariadb*
* **Table Prefix:** *wp_*

## External Access

An Ingress is created during the installation process. To access your wordpress use http://wordpress.YOUR_CLUSTER_ID.k8s.civo.com