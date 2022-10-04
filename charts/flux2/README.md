# flux2

![Version: 1.6.0](https://img.shields.io/badge/Version-1.6.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.35.0](https://img.shields.io/badge/AppVersion-0.35.0-informational?style=flat-square)

A Helm chart for flux2

This helm chart is maintain and released by the fluxcd-community on a best effort basis.

## Source Code

* <https://github.com/fluxcd-community/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| cli.affinity | object | `{}` |  |
| cli.image | string | `"ghcr.io/fluxcd/flux-cli"` |  |
| cli.nodeSelector | object | `{}` |  |
| cli.tag | string | `"v0.35.0"` |  |
| cli.tolerations | list | `[]` |  |
| eventsaddr | string | `"http://notification-controller/"` | Maybe you need to use full domain name here, if you deploy flux in environments that use http proxy.  In such environments they normally add `.cluster.local` and `.local` suffixes to `no_proxy` variable in order to prevent cluster-local traffic from going through http proxy. Without fully specified domain they need to mention `notifications-controller` explicitly in `no_proxy` variable after debugging http proxy logs eg: http://notification-controller.[NAMESPACE].svc.[CLUSTERDOMAIN] if notification controller is disabled this is not set |
| extraObjects | list | `[]` | Array of extra K8s manifests to deploy |
| helmcontroller.affinity | object | `{}` |  |
| helmcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| helmcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| helmcontroller.container.additionalargs | list | `[]` |  |
| helmcontroller.create | bool | `true` |  |
| helmcontroller.image | string | `"ghcr.io/fluxcd/helm-controller"` |  |
| helmcontroller.imagePullPolicy | object | `{}` |  |
| helmcontroller.labels | object | `{}` |  |
| helmcontroller.nodeSelector | object | `{}` |  |
| helmcontroller.priorityClassName | string | `""` |  |
| helmcontroller.resources.limits | object | `{}` |  |
| helmcontroller.resources.requests.cpu | string | `"100m"` |  |
| helmcontroller.resources.requests.memory | string | `"64Mi"` |  |
| helmcontroller.serviceaccount.annotations | object | `{}` |  |
| helmcontroller.serviceaccount.create | bool | `true` |  |
| helmcontroller.tag | string | `"v0.25.0"` |  |
| helmcontroller.tolerations | list | `[]` |  |
| imagePullSecrets | list | `[]` | contents of pod imagePullSecret in form 'name=[secretName]'; applied to all controllers |
| imageautomationcontroller.affinity | object | `{}` |  |
| imageautomationcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| imageautomationcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| imageautomationcontroller.container.additionalargs | list | `[]` |  |
| imageautomationcontroller.create | bool | `true` |  |
| imageautomationcontroller.image | string | `"ghcr.io/fluxcd/image-automation-controller"` |  |
| imageautomationcontroller.imagePullPolicy | object | `{}` |  |
| imageautomationcontroller.labels | object | `{}` |  |
| imageautomationcontroller.nodeSelector | object | `{}` |  |
| imageautomationcontroller.priorityClassName | string | `""` |  |
| imageautomationcontroller.resources.limits | object | `{}` |  |
| imageautomationcontroller.resources.requests.cpu | string | `"100m"` |  |
| imageautomationcontroller.resources.requests.memory | string | `"64Mi"` |  |
| imageautomationcontroller.serviceaccount.annotations | object | `{}` |  |
| imageautomationcontroller.serviceaccount.create | bool | `true` |  |
| imageautomationcontroller.tag | string | `"v0.26.0"` |  |
| imageautomationcontroller.tolerations | list | `[]` |  |
| imagereflectorcontroller.affinity | object | `{}` |  |
| imagereflectorcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| imagereflectorcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| imagereflectorcontroller.container.additionalargs | list | `[]` |  |
| imagereflectorcontroller.create | bool | `true` |  |
| imagereflectorcontroller.image | string | `"ghcr.io/fluxcd/image-reflector-controller"` |  |
| imagereflectorcontroller.imagePullPolicy | object | `{}` |  |
| imagereflectorcontroller.labels | object | `{}` |  |
| imagereflectorcontroller.nodeSelector | object | `{}` |  |
| imagereflectorcontroller.priorityClassName | string | `""` |  |
| imagereflectorcontroller.resources.limits | object | `{}` |  |
| imagereflectorcontroller.resources.requests.cpu | string | `"100m"` |  |
| imagereflectorcontroller.resources.requests.memory | string | `"64Mi"` |  |
| imagereflectorcontroller.serviceaccount.annotations | object | `{}` |  |
| imagereflectorcontroller.serviceaccount.create | bool | `true` |  |
| imagereflectorcontroller.tag | string | `"v0.22.0"` |  |
| imagereflectorcontroller.tolerations | list | `[]` |  |
| installCRDs | bool | `true` |  |
| kustomizecontroller.affinity | object | `{}` |  |
| kustomizecontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| kustomizecontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| kustomizecontroller.container.additionalargs | list | `[]` |  |
| kustomizecontroller.create | bool | `true` |  |
| kustomizecontroller.envFrom | object | `{"map":{"name":""},"secret":{"name":""}}` | Defines envFrom using a configmap and/or secret. |
| kustomizecontroller.extraSecretMounts | list | `[]` | Defines additional mounts with secrets. Secrets must be manually created in the namespace or with kustomizecontroller.secret |
| kustomizecontroller.image | string | `"ghcr.io/fluxcd/kustomize-controller"` |  |
| kustomizecontroller.imagePullPolicy | object | `{}` |  |
| kustomizecontroller.labels | object | `{}` |  |
| kustomizecontroller.nodeSelector | object | `{}` |  |
| kustomizecontroller.priorityClassName | string | `""` |  |
| kustomizecontroller.resources.limits | object | `{}` |  |
| kustomizecontroller.resources.requests.cpu | string | `"100m"` |  |
| kustomizecontroller.resources.requests.memory | string | `"64Mi"` |  |
| kustomizecontroller.secret.create | bool | `false` | Create a secret to use it with extraSecretMounts. Defaults to false. |
| kustomizecontroller.secret.data | object | `{}` |  |
| kustomizecontroller.secret.name | string | `""` |  |
| kustomizecontroller.serviceaccount.annotations | object | `{}` |  |
| kustomizecontroller.serviceaccount.create | bool | `true` |  |
| kustomizecontroller.tag | string | `"v0.29.0"` |  |
| kustomizecontroller.tolerations | list | `[]` |  |
| loglevel | string | `"info"` |  |
| multitenancy.defaultServiceAccount | string | `"default"` | All Kustomizations and HelmReleases which don’t have spec.serviceAccountName specified, will use the default account from the tenant’s namespace. Tenants have to specify a service account in their Flux resources to be able to deploy workloads in their namespaces as the default account has no permissions. |
| multitenancy.enabled | bool | `false` | Implement the patches for Multi-tenancy lockdown. See https://fluxcd.io/docs/installation/#multi-tenancy-lockdown |
| multitenancy.privileged | bool | `true` | Both kustomize-controller and helm-controller service accounts run privileged with cluster-admin ClusterRoleBinding. Disable if you want to run them with a minimum set of permissions. |
| notificationcontroller.affinity | object | `{}` |  |
| notificationcontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| notificationcontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| notificationcontroller.container.additionalargs | list | `[]` |  |
| notificationcontroller.create | bool | `true` |  |
| notificationcontroller.image | string | `"ghcr.io/fluxcd/notification-controller"` |  |
| notificationcontroller.imagePullPolicy | object | `{}` |  |
| notificationcontroller.labels | object | `{}` |  |
| notificationcontroller.nodeSelector | object | `{}` |  |
| notificationcontroller.priorityClassName | string | `""` |  |
| notificationcontroller.resources.limits | object | `{}` |  |
| notificationcontroller.resources.requests.cpu | string | `"100m"` |  |
| notificationcontroller.resources.requests.memory | string | `"64Mi"` |  |
| notificationcontroller.service.annotations | object | `{}` |  |
| notificationcontroller.service.labels | object | `{}` |  |
| notificationcontroller.serviceaccount.annotations | object | `{}` |  |
| notificationcontroller.serviceaccount.create | bool | `true` |  |
| notificationcontroller.tag | string | `"v0.27.0"` |  |
| notificationcontroller.tolerations | list | `[]` |  |
| notificationcontroller.webhookReceiver.service.annotations | object | `{}` |  |
| notificationcontroller.webhookReceiver.service.labels | object | `{}` |  |
| policies.create | bool | `true` |  |
| prometheus.podMonitor.create | bool | `false` | Enables podMonitor endpoint |
| prometheus.podMonitor.podMetricsEndpoints[0].port | string | `"http-prom"` |  |
| prometheus.podMonitor.podMetricsEndpoints[0].relabelings[0].action | string | `"keep"` |  |
| prometheus.podMonitor.podMetricsEndpoints[0].relabelings[0].regex | string | `"Running"` |  |
| prometheus.podMonitor.podMetricsEndpoints[0].relabelings[0].sourceLabels[0] | string | `"__meta_kubernetes_pod_phase"` |  |
| rbac.create | bool | `true` |  |
| sourcecontroller.affinity | object | `{}` |  |
| sourcecontroller.annotations."prometheus.io/port" | string | `"8080"` |  |
| sourcecontroller.annotations."prometheus.io/scrape" | string | `"true"` |  |
| sourcecontroller.container.additionalargs | list | `[]` |  |
| sourcecontroller.create | bool | `true` |  |
| sourcecontroller.extraEnv | list | `[]` |  |
| sourcecontroller.image | string | `"ghcr.io/fluxcd/source-controller"` |  |
| sourcecontroller.imagePullPolicy | object | `{}` |  |
| sourcecontroller.labels | object | `{}` |  |
| sourcecontroller.nodeSelector | object | `{}` |  |
| sourcecontroller.priorityClassName | string | `""` |  |
| sourcecontroller.resources.limits | object | `{}` |  |
| sourcecontroller.resources.requests.cpu | string | `"100m"` |  |
| sourcecontroller.resources.requests.memory | string | `"64Mi"` |  |
| sourcecontroller.service.annotations | object | `{}` |  |
| sourcecontroller.service.labels | object | `{}` |  |
| sourcecontroller.serviceaccount.annotations | object | `{}` |  |
| sourcecontroller.serviceaccount.create | bool | `true` |  |
| sourcecontroller.tag | string | `"v0.30.0"` |  |
| sourcecontroller.tolerations | list | `[]` |  |
| watchallnamespaces | bool | `true` |  |
