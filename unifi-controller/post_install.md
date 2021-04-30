## Unifi Controller 

> To allow for persistant storage, this application has a dependency on Longhorn and therefore you will require a minimum or 3 nodes.

### Usage instructions

You will need the following ports setup to access the UI and also allow your devices to contact the cloud controller:

UDP 	3478 	Port used for STUN.
TCP 	8080 	Port used for device and controller communication.
TCP 	8443 	Port used for controller GUI/API as seen in a web browser
TCP 	8880 	Port used for HTTP portal redirection.
TCP 	8843 	Port used for HTTPS portal redirection.
TCP 	6789 	Port used for UniFi mobile speed test.

>  NOTE: These ports need to be open at the gateway/firewall as well as on the controller host. This would be achieved by creating port forwards on the gateway/firewall where the controller host is located.

There is a guide on how to setup the controller with Traefik2 here:



