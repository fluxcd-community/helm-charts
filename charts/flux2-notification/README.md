# flux2-notification

![Version: 0.5.2](https://img.shields.io/badge/Version-0.5.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.29.3](https://img.shields.io/badge/AppVersion-0.29.3-informational?style=flat-square)

A Helm chart for flux2 alerts and the needed providers and secrets

This helm chart is maintain and released by the fluxcd-community on a best effort basis.

## Source Code

* <https://github.com/fluxcd-community/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| alertlist | list | `[]` | A list of alerts to be used. See values.yaml for example |
| providerlist | list | `[]` | A list of providers to be used. See values.yaml for example |
| secretlist | list | `[]` | A list of secrets to be used. See values.yaml for example For help see: https://fluxcd.io/docs/components/notification/provider/ |
