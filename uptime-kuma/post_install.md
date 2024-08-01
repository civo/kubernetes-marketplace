# Uptime-Kuma

Uptime-Kuma is a self-hosted, open-source monitoring tool that accommodates a wide range of monitor types, from HTTP/HTTPS to TCP, DNS, and more. The tool offers alerting and notification[email, Slack, Discord, and more] capabilities and flexible to customize dashboards and monitors.

## External Access

An Ingress is created during the installation process. To access uptime-kuma use `http://uk.YOUR_CLUSTER_ID.k8s.civo.com`

Replace YOUR_CLUSTER_ID with your actual cluster ID.



### Create Admin User

By default Uptime-kuma does not create Admin user during the installation process. In order to access Uptime-kuma and setup status page, monitors, and dashboards, you will need to create your Uptime-kuma Admin user first. This can be done right after your installation process via accesing the above mentioned url.

Create an Admin account with username and password.

Checkout the more information and next steps here - https://github.com/louislam/uptime-kuma

