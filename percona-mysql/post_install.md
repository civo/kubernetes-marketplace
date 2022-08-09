NOTES:
1. To get a MySQL prompt inside your new cluster you can run:

    ROOT_PASSWORD=`kubectl -n pxc get secrets my-db-pxc-db -o jsonpath="{.data.root}" | base64 --decode`
    kubectl -n pxc exec -ti \
      my-db-pxc-db-pxc-0 -c pxc -- mysql -uroot -p"$ROOT_PASSWORD"

2. To connect an Application running in the same Kubernetes cluster you can connect with:


$ kubectl run -i --tty --rm percona-client --image=percona --restart=Never \
  -- mysql -h  my-db-pxc-db-pxc.pxc.svc.cluster.local -uroot -p"$ROOT_PASSWORD"
