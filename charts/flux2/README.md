# flux2

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.20.1](https://img.shields.io/badge/AppVersion-0.20.1-informational?style=flat-square)

A Helm chart for flux2

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| helmcontroller.affinity | object | `{}` |  |
| helmcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| helmcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| helmcontroller.create | bool | `true` |  |
| helmcontroller.image | string | `"ghcr.io/fluxcd/helm-controller"` |  |
| helmcontroller.labels | object | `{}` |  |
| helmcontroller.nodeSelector | object | `{}` |  |
| helmcontroller.resources.limits.cpu | string | `"1000m"` |  |
| helmcontroller.resources.limits.memory | string | `"1Gi"` |  |
| helmcontroller.resources.requests.cpu | string | `"100m"` |  |
| helmcontroller.resources.requests.memory | string | `"64Mi"` |  |
| helmcontroller.serviceaccount.annotations | object | `{}` |  |
| helmcontroller.tag | string | `"v0.12.1"` |  |
| helmcontroller.tolerations | list | `[]` |  |
| imageautomationcontroller.affinity | object | `{}` |  |
| imageautomationcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| imageautomationcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| imageautomationcontroller.create | bool | `true` |  |
| imageautomationcontroller.image | string | `"ghcr.io/fluxcd/image-automation-controller"` |  |
| imageautomationcontroller.labels | object | `{}` |  |
| imageautomationcontroller.nodeSelector | object | `{}` |  |
| imageautomationcontroller.resources.limits.cpu | string | `"1000m"` |  |
| imageautomationcontroller.resources.limits.memory | string | `"1Gi"` |  |
| imageautomationcontroller.resources.requests.cpu | string | `"100m"` |  |
| imageautomationcontroller.resources.requests.memory | string | `"64Mi"` |  |
| imageautomationcontroller.serviceaccount.annotations | object | `{}` |  |
| imageautomationcontroller.tag | string | `"v0.16.0"` |  |
| imageautomationcontroller.tolerations | list | `[]` |  |
| imagereflectorcontroller.affinity | object | `{}` |  |
| imagereflectorcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| imagereflectorcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| imagereflectorcontroller.create | bool | `true` |  |
| imagereflectorcontroller.image | string | `"ghcr.io/fluxcd/image-reflector-controller"` |  |
| imagereflectorcontroller.labels | object | `{}` |  |
| imagereflectorcontroller.nodeSelector | object | `{}` |  |
| imagereflectorcontroller.resources.limits.cpu | string | `"1000m"` |  |
| imagereflectorcontroller.resources.limits.memory | string | `"1Gi"` |  |
| imagereflectorcontroller.resources.requests.cpu | string | `"100m"` |  |
| imagereflectorcontroller.resources.requests.memory | string | `"64Mi"` |  |
| imagereflectorcontroller.serviceaccount.annotations | object | `{}` |  |
| imagereflectorcontroller.tag | string | `"v0.13.0"` |  |
| imagereflectorcontroller.tolerations | list | `[]` |  |
| kustomizecontroller.affinity | object | `{}` |  |
| kustomizecontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| kustomizecontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| kustomizecontroller.create | bool | `true` |  |
| kustomizecontroller.extraSecretMounts | list | `[]` |  |
| kustomizecontroller.image | string | `"ghcr.io/fluxcd/kustomize-controller"` |  |
| kustomizecontroller.labels | object | `{}` |  |
| kustomizecontroller.nodeSelector | object | `{}` |  |
| kustomizecontroller.resources.limits.cpu | string | `"1000m"` |  |
| kustomizecontroller.resources.limits.memory | string | `"1Gi"` |  |
| kustomizecontroller.resources.requests.cpu | string | `"100m"` |  |
| kustomizecontroller.resources.requests.memory | string | `"64Mi"` |  |
| kustomizecontroller.serviceaccount.annotations | object | `{}` |  |
| kustomizecontroller.tag | string | `"v0.16.0"` |  |
| kustomizecontroller.tolerations | list | `[]` |  |
| notificationcontroller.affinity | object | `{}` |  |
| notificationcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| notificationcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| notificationcontroller.create | bool | `true` |  |
| notificationcontroller.image | string | `"ghcr.io/fluxcd/notification-controller"` |  |
| notificationcontroller.labels | object | `{}` |  |
| notificationcontroller.nodeSelector | object | `{}` |  |
| notificationcontroller.resources.limits.cpu | string | `"1000m"` |  |
| notificationcontroller.resources.limits.memory | string | `"1Gi"` |  |
| notificationcontroller.resources.requests.cpu | string | `"100m"` |  |
| notificationcontroller.resources.requests.memory | string | `"64Mi"` |  |
| notificationcontroller.serviceaccount.annotations | object | `{}` |  |
| notificationcontroller.tag | string | `"v0.18.1"` |  |
| notificationcontroller.tolerations | list | `[]` |  |
| policies.create | bool | `true` |  |
| rbac.create | bool | `true` |  |
| sourcecontroller.affinity | object | `{}` |  |
| sourcecontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| sourcecontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| sourcecontroller.create | bool | `true` |  |
| sourcecontroller.image | string | `"ghcr.io/fluxcd/source-controller"` |  |
| sourcecontroller.labels | object | `{}` |  |
| sourcecontroller.nodeSelector | object | `{}` |  |
| sourcecontroller.resources.limits.cpu | string | `"1000m"` |  |
| sourcecontroller.resources.limits.memory | string | `"1Gi"` |  |
| sourcecontroller.resources.requests.cpu | string | `"100m"` |  |
| sourcecontroller.resources.requests.memory | string | `"64Mi"` |  |
| sourcecontroller.serviceaccount.annotations | object | `{}` |  |
| sourcecontroller.tag | string | `"v0.17.1"` |  |
| sourcecontroller.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
