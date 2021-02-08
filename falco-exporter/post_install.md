## Falco Exporter is a Prometheus Metrics Exporter for Falco output events

### Get started

[Falco Security docs](https://github.com/falcosecurity/falco-exporter)


[Configuration](https://github.com/falcosecurity/charts/tree/master/falco-exporter#configuration)


### For Fine Tuning your exporter

Use curl or manually download Falco Exporter [default values](https://raw.githubusercontent.com/falcosecurity/charts/master/falco-exporter/values.yaml) and save it as values.yaml

See [Documentation](https://github.com/falcosecurity/charts/tree/master/falco-exporter) for configurable parameters of the chart and their default values or comments in values.yaml

Delete current installation of Falco exporter with 
```helm uninstall falco-exporter```

Deploy Falco exporter with your new settings
```helm install falco-exporter -f values.yaml falcosecurity/falco-exporter```