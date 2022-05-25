# flux2-sync

![Version: 0.3.9](https://img.shields.io/badge/Version-0.3.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)

A Helm chart for flux2 GitRepository to sync with

This helm chart is maintain and released by the fluxcd-community on a best effort basis.

## Source Code

* <https://github.com/fluxcd-community/helm-charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| gitRepository.spec.gitImplementation | Optional | `""` | Determines which git client library to use. Defaults to go-git, valid values are (‘go-git’, ‘libgit2’). |
| gitRepository.spec.ignore | Optional | `""` | Ignore overrides the set of excluded patterns in the .sourceignore format (which is the same as .gitignore). If not provided, a default will be used, consult the documentation for your version to find out what those are. |
| gitRepository.spec.include | Optional | `[]` | Extra git repositories to map into the repository |
| gitRepository.spec.interval | string | `"5m"` | The interval at which to check for repository updates. |
| gitRepository.spec.recurseSubmodules | Optional | `false` | When enabled, after the clone is created, initializes all submodules within, using their default settings. This option is available only when using the ‘go-git’ GitImplementation. |
| gitRepository.spec.ref | Optional | `{"branch":"master"}` | The Git reference to checkout and monitor for changes, defaults to master branch. |
| gitRepository.spec.secretRef | Optional | `{}` | The secret name containing the Git credentials. For HTTPS repositories the secret must contain username and password fields. For SSH repositories the secret must contain identity, identity.pub and known_hosts fields. If a secret.create is set, it will point to that one. |
| gitRepository.spec.suspend | Optional | `""` | This flag tells the controller to suspend the reconciliation of this source. |
| gitRepository.spec.timeout | Optional | `""` | The timeout for remote Git operations like cloning, defaults to 20s. |
| gitRepository.spec.url | string | `""` | The Git repository URL, can be an HTTP/S or SSH address. |
| gitRepository.spec.verify | Optional | `{}` | Verify OpenPGP signature for the Git commit HEAD points to. |
| helmRepository.spec.interval | string | `"5m"` | The interval at which the Helm repository index is consulted at. |
| helmRepository.spec.passCredentials | Optional | `false` | Whether credentials from the Secret reference is allowed to be passed on to a host that does not match the host as defined in URL. Enable this with caution, as credentials can get stolen in a man-in-the-middle attack. |
| helmRepository.spec.secretRef | object | `{}` | The secret name containing the Helm credentials. For basic access authentication the secret must contain username and password fields. For TLS authentication the secret must contain certFile, keyFile and/or caFile fields. |
| helmRepository.spec.suspend | Optional | `""` | This flag tells the controller to suspend the reconciliation of this source. |
| helmRepository.spec.timeout | Optional | `""` | The timeout for fetch operations, defaults to 60s. |
| helmRepository.spec.url | string | `""` | The HTTP/S address of the Helm repository. |
| kustomization.spec.decryption | Optional | `{}` | Decrypt Kubernetes secrets before applying them on the cluster. |
| kustomization.spec.dependsOn | Optional | `[]` | DependsOn may contain a dependency.CrossNamespaceDependencyReference slice with references to Kustomization resources that must be ready before this Kustomization can be reconciled. |
| kustomization.spec.force | Optional | `false` | Force instructs the controller to recreate resources when patching fails due to an immutable field change. Defaults to false. |
| kustomization.spec.healthChecks | Optional | `[]` | A list of resources to be included in the health assessment. |
| kustomization.spec.images | Optional | `[]` | Images is a list of (image name, new name, new tag or digest) for changing image names, tags or digests. This can also be achieved with a patch, but this operator is simpler to specify. |
| kustomization.spec.interval | string | `"5m"` | The interval at which to reconcile the Kustomization. |
| kustomization.spec.kubeConfig | Optional | `{}` | The KubeConfig for reconciling the Kustomization on a remote cluster. When specified, KubeConfig takes precedence over ServiceAccountName. |
| kustomization.spec.patches | Optional | `[]` | Strategic merge and JSON patches, defined as inline YAML objects, capable of targeting objects based on kind, label and annotation selectors. |
| kustomization.spec.path | Optional | `""` | Path to the directory containing the kustomization.yaml file, or the set of plain YAMLs a kustomization.yaml should be generated for. Defaults to ‘None’, which translates to the root path of the SourceRef. |
| kustomization.spec.postBuild | Optional | `{}` | PostBuild describes which actions to perform on the YAML manifest generated by building the kustomize overlay. |
| kustomization.spec.prune | bool | `true` | Prune enables garbage collection. Defaults to true. |
| kustomization.spec.retryInterval | Optional | `""` | The interval at which to retry a previously failed reconciliation. When not specified, the controller uses the KustomizationSpec.Interval value to retry failures. |
| kustomization.spec.serviceAccountName | Optional | `""` | The name of the Kubernetes service account to impersonate when reconciling this Kustomization. |
| kustomization.spec.suspend | Optional | `""` | This flag tells the controller to suspend subsequent kustomize executions, it does not apply to already started executions. Defaults to false. |
| kustomization.spec.targetNamespace | Optional | `""` | TargetNamespace sets or overrides the namespace in the kustomization.yaml file. |
| kustomization.spec.timeout | Optional | `""` | Timeout for validation, apply and health checking operations. Defaults to ‘Interval’ duration |
| kustomization.spec.wait | Optional | `false` | Wait instructs the controller to check the health of all the reconciled resources. When enabled, the HealthChecks are ignored. Defaults to false. |
| kustomizationlist | Optional | `{}` | If you want multiple subdirectories which depend on each other in the same repo. Their name is derived from their path. |
| secret.create | bool | `false` | Create a secret for the git repository. Defaults to false. |
| secret.data | object | `{}` | Data of the secret. For HTTPS repositories the secret must contain username and password fields. For SSH repositories the secret must contain identity, identity.pub and known_hosts fields. Values will be encoded to base64 by the helm chart. |
