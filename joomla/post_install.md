## Joomla

### Usage instructions

### DB Root Password

To retrieve MariaDB root password, run:

```
$ kubectl -n mariadb get secret mysql-pass -o=jsonpath='{.data.MYSQL_ROOT_PASSWORD}' | base64 -d
```

### DB Setup

Before running the setup wizard you will need to create a database and user account in mariadb

```
$ kubectl -n mariadb exec -it svc/mariadb -- /bin/sh

# mysql -u root -p
Enter password: enter_db_root_password_here

MariaDB [(none)]> CREATE DATABASE joomla_db;
MariaDB [(none)]> CREATE USER joomla_user identified by 'strong-password';
MariaDB [(none)]> GRANT ALL ON joomla_db.* TO joomla_user;
```

### External Access

An ingress is automatically created during the application install. A certificate using cert manager and lets-encrypt is also applied automatically and registered against your Civo email address and the generated domain name.

You can access this via: https://joomla.DOMAIN_NAME

###

You should now see the setup page where you can enter the database details created above.

> Note the database server is called `mariadb.mariadb`
