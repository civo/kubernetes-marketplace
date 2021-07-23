# WordPress

## DB Root Password

To retrieve MariaDB root password, run:

```
$ kubectl -n mariadb get secret mysql-pass -o=jsonpath='{.data.MYSQL_ROOT_PASSWORD}' | base64 -d
```

## Database Creation

You'll need to create a user and a database in MariaDB before you can configure your Wordpress.

```
$ kubectl exec -it svc/mariadb -- /bin/sh

# mysql -u root -p
Enter password: enter_db_root_password_here

MariaDB [(none)]> CREATE DATABASE wordpress_db;
MariaDB [(none)]> CREATE USER wordpress_user identified by 'strong-password';
MariaDB [(none)]> GRANT ALL ON wordpress_db.* TO wordpress_user;
```

## SSL behind a proxy server

Traefik works as a proxy server, so you need to alert WordPress of that fact. Without this configuration you'll see a **too many redirects** error when accessing the page.

To simplify this configuration when the WordPress is installed an script is created to add the required lines to the _wp-config-sample.php_

Use the following command to execute it when your WordPress pod reach running state.

```
 kubectl exec -it svc/wordpress -- bash -c /var/www/html/civo-init.sh
```

After the script execution the following lines will be added to the _wp-config-sample.php_ file, and they will be present in wp-config.php after wizard setup.

```
if (isset($_SERVER['HTTP_X_FORWARDED_PROTO']) && $_SERVER['HTTP_X_FORWARDED_PROTO'] === 'https') {
        $_SERVER['HTTPS'] = 'on';
}
```

## WordPress Wizard Setup

The first time you access to your WordPress a wizard setup will be loaded. In the first step you will select the language, and then you will be asked for your database connection information.

Based on the database creation example above, the fields would be filled like this:

- **Database Name:** _wordpress_db_
- **Username:** _wordpress_user_
- **Password:** _strong-password_
- **Database Host:** _mariadb_
- **Table Prefix:** _wp\__

## External Access

An Ingress is created during the installation process. To access your wordpress use http://wordpress.DOMAIN_NAME

If you want to change the hostname or modify the ingress, edit it with

```
kubectl edit ingress wordpress
```
