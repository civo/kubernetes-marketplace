# WordPress

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

## SSL behind a proxy server

Traefik works as a proxy server, so you need to alert WordPress of that fact. Without this configuration you'll see a **too many redirects** error when accessing the page.

To simplify this configuration when the WordPress is installed an script is created to add the required lines to the *wp-config-sample.php*

Use the following command to execute it when your WordPress pod reach running state.

```
 kubectl exec -it svc/wordpress -- bash -c /var/www/html/civo-init.sh
```

After the script execution the following lines will be added to the *wp-config-sample.php* file, and they will be present in wp-config.php after wizard setup.

```
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
        $_SERVER['HTTPS'] = 'on';
}
```

## WordPress Wizard Setup

The first time you access to your WordPress a wizard setup will be loaded. In the first step you will select the language, and then you will be asked for your database connection information.

Based on the database creation example above, the fields would be filled like this:

* **Database Name:** *wordpress_db*
* **Username:** *wordpress_user*
* **Password:** *strong-password*
* **Database Host:** *mariadb*
* **Table Prefix:** *wp_*

## External Access

An Ingress is created during the installation process. To access your wordpress use http://wordpress.YOUR_CLUSTER_ID.k8s.civo.com

If you want to change the hostname or modify the ingress, edit it with
```
kubectl edit ingress wordpress
```
