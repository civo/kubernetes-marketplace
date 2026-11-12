# LibreDB Studio

LibreDB Studio is a browser-based SQL IDE that runs inside the cluster, so database credentials stay in the cluster instead of on each developer's laptop. It connects to sixteen engines, including PostgreSQL, MySQL, SQL Server, Oracle, MongoDB, Redis, ClickHouse and Trino.

## Access

An Ingress is created during installation, with a Let's Encrypt certificate issued by cert-manager. Open `https://libredb.YOUR_CLUSTER_ID.k8s.civo.com`, replacing YOUR_CLUSTER_ID with your cluster ID. The first request can take a minute while the certificate is issued.

The Ingress answers on HTTPS only, so the same address over plain `http://` returns 404. That is deliberate: the session cookie is issued with the Secure flag, so a login over plain HTTP would put the password on the wire and then fail anyway.

Sign in with `admin@libredb.org` and the admin password shown for this application in the Civo dashboard.

## First steps

1. Add a connection from the sidebar. A database running in the same cluster is reachable by its service name, for example host `postgresql.default.svc.cluster.local`.
2. Run a query, then use the schema browser, the ER diagram and the data profiler on the same connection.

## Notes

- State lives in a 1Gi volume mounted at `/app/data` (SQLite). Connections and query history survive a pod restart.
- If you replace the Ingress with one that serves plain HTTP, set `AUTH_COOKIE_SECURE=false` on the deployment as well, or login will fail while every health check stays green.
- AI query assistance is off until you set `LLM_PROVIDER` and `LLM_API_KEY`. Everything else works without it.

Documentation: https://github.com/libredb/libredb-studio
