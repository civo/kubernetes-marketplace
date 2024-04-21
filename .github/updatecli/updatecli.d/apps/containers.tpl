#
# This policy updates container image tags defined in files app.yaml
# containers to monitor must be specified in the values file:
# .github/updatecli/values.d/apps.yaml
# 
# The app/container policy generates one update pipeline per app where an app can contain multiple containers
# To show generated pipeline you can run (from the root repository)
#   updatecli manifest show --config .github/updatecli/updatecli.d/apps/containers.tpl --values .github/updatecli/values.d/scm.yaml --values .github/updatecli/values.d/apps.yaml
# To test what this policy would change
#   updatecli diff --config .github/updatecli/updatecli.d/apps/containers.tpl --values .github/updatecli/values.d/scm.yaml --values .github/updatecli/values.d/apps.yaml

{{ $github := .github }}

{{ range $id, $app := .apps }}
---
name: 'deps: bump container {{ $id }} tag'
pipelineid: 'containers/{{ $id }}'
sources:
  {{ range $i, $container := $app }}
  {{ $container.image }}:
    name: 'Get latest tag for {{ $container.image }}'
    kind: 'dockerimage'
    spec:
      image: '{{ $container.image }}'
      {{ if $container.tagfilter }}
      tagfilter: '{{ $container.tagfilter }}'
      {{ end }}
      {{ if $container.versionfilter }}
      versionfilter:
{{ $container.versionfilter  | toYaml | indent 8 }}
      {{ end }}
  {{ end }}

targets:
  {{ range $i, $container := $app }}
  {{ if eq $i 0 }}
  manifest:
    name: 'Update {{ $id }} /manifest.yaml'
    kind: 'yaml'
    sourceid: '{{ $container.image }}'
    scmid: 'kubernetes-marketplace'
    spec:
      file: '{{ $id }}/manifest.yaml'
      key: '$.version'
  {{ end }}

  {{ $container.image }}:
    name: 'Update {{ $id }}/app.yaml'
    kind: 'file'
    scmid: 'kubernetes-marketplace'
    disablesourceinput: true
    spec:
      file: '{{ $id }}/app.yaml'
      matchpattern: '(?m)image: {{ $container.image }}:(.*)'
      replacepattern: 'image: {{ $container.image }}:{{ "{{" }} source "{{ $container.image }}" {{ "}}" }}'
  {{ end }}

# Define git repository configuration to know where to push changes
# Values are templated and provided via the values.yaml so we can easily 
# adapt to the repository owner.
scms:
  kubernetes-marketplace:
    kind: "github"
    spec:
      user: "{{ $github.user }}"
      email: "{{ $github.email }}"
      owner: "{{ $github.owner }}"
      repository: "{{ $github.repository }}"
      branch: "{{ $github.branch }}"
      username: '{{ requiredEnv "UPDATECLI_GITHUB_ACTOR" }}'
      token: '{{ requiredEnv "UPDATECLI_GITHUB_TOKEN" }}'

actions:  
  kubernetes-marketplace:
    kind: "github/pullrequest"
    scmid: "kubernetes-marketplace"
    spec:
      title: 'deps: bump container tag for {{ $id }}'
      usetitleforautomerge: true
      mergemethod: squash
      labels:
        - enhancement 
{{ end }}
