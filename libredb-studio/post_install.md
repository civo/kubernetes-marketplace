# LibreDB Studio

LibreDB Studio is a browser-based SQL IDE that runs inside the cluster, so database credentials stay in the cluster instead of on each developer's laptop. It connects to sixteen engines, including PostgreSQL, MySQL, SQL Server, Oracle, MongoDB, Redis, ClickHouse and Trino.

## Access

An Ingress is created during installation. Open `http://libredb.YOUR_CLUSTER_ID.k8s.civo.com`, replacing YOUR_CLUSTER_ID with your cluster ID.

Sign in with `admin@libredb.org` and the admin password shown for this application in the Civo dashboard.

## First steps

1. Add a connection from the sidebar. A database running in the same cluster is reachable by its service name, for example host `postgresql.default.svc.cluster.local`.
2. Run a query, then use the schema browser, the ER diagram and the data profiler on the same connection.

## Notes

- State lives in a 1Gi volume mounted at `/app/data` (SQLite). Connections and query history survive a pod restart.
- The Ingress serves plain HTTP, so the app is configured with `AUTH_COOKIE_SECURE=false`. Once you front it with TLS, set that variable to `true` on the `libredb-studio` deployment.
- AI query assistance is off until you set `LLM_PROVIDER` and `LLM_API_KEY`. Everything else works without it.

Documentation: https://github.com/libredb/libredb-studio
