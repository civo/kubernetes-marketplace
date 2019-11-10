## kubedb: A Kubernetes Operator for running MySQL, PostgreSQL, MongoDB, and other databases

### Prerequisites

Make sure a Longhorn is set as a default storage provider.  You can do so with the following command:

```
kubectl patch storageclass longhorn -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
```

When creating databases, make sure storageClassName is not specified, or calls out `longhorn` specifically.

### Operator Usage

Once the operator is installed, a custom resource will need to be deployed 
to actually create a database.  Some quickstarts below:

_Relational_
* [MySQL Quickstart](https://kubedb.com/docs/0.12.0/guides/mysql/quickstart/quickstart/)
* [PostgreSQL Quickstart](https://kubedb.com/docs/0.12.0/guides/postgres/quickstart/quickstart/)

_NoSQL_
* [ElasticSearch Quickstart](https://kubedb.com/docs/0.12.0/guides/elasticsearch/quickstart/quickstart/)
* [Memcached Quickstart](https://kubedb.com/docs/0.12.0/guides/memcached/quickstart/quickstart/)
* [MongoDB Quickstart](https://kubedb.com/docs/0.12.0/guides/mongodb/quickstart/quickstart/)
* [Redis Quickstart](https://kubedb.com/docs/0.12.0/guides/redis/quickstart/quickstart/)

