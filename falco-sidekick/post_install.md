## Falco is a Cloud Native Runtime Security tool designed to detect anomalous activity in your applications

### Get started

[Falco Security docs](https://falco.org/docs/)


[Add your Rules](https://falco.org/docs/rules/)


### For Fine Tuning your Falco Sidekick

Use curl or manually download Falco Sidekick [default values](https://raw.githubusercontent.com/falcosecurity/charts/master/falcosidekick/values.yaml) and save it as values.yaml

See [Documentation](https://github.com/falcosecurity/charts/tree/master/falcosidekick) for configurable parameters of the chart and their default values or comments in values.yaml

Delete current installation of Falco Sidekick with 
```helm uninstall falcosidekick```

Deploy Falco Sidekick with your new settings
```helm install falcosidekick -f values.yaml falcosecurity/falcosidekick```