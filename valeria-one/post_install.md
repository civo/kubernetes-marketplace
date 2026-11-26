# Valeria One

Valeria One is now installing in the `valeria-one` namespace (the app, its background worker and a PostgreSQL
database).

## Create your admin account

The first account is created from a one-time **setup link** that the app prints in its logs. Fetch it with:

```
kubectl -n valeria-one logs deploy/valeria-one | grep setup
```

Open that link in your browser to create the admin account. After that, login is required (only the first
account and people you invite can sign in).

## Reaching it

Once the pods are ready, Valeria One is available at:

```
http://valeria-one.<CLUSTER_ID>.k8s.civo.com
```

(the address is also shown in the Ingress). For HTTPS, put it behind your own ingress/cert-manager or a
load balancer with TLS.

## Notes

- AI, messaging and payments are optional and use **your own** provider accounts (OpenAI/Anthropic/Gemini,
  Twilio or Meta, Stripe, Facturapi). Valeria One runs fine with none of them.
- All business data (including uploaded photos and media) is stored in PostgreSQL. The only thing the app
  writes to disk is a generated secret key, kept on the `valeria-one-data` volume.
- Licensed AGPL-3.0. Repo and issues: https://github.com/valeriaone/valeria-one
