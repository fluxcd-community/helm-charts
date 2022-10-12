# Change Log

## Next Release

![AppVersion: 0.35.0](https://img.shields.io/static/v1?label=AppVersion&message=0.35.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Bump semver in tests Signed-off-by: Matthew Field <fieldm58@gmail.com>

### Default value changes

```diff
# No changes in this release
```

## 1.7.0

**Release date:** 2022-10-12

![AppVersion: 0.35.0](https://img.shields.io/static/v1?label=AppVersion&message=0.35.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add extraEnv to all controllers. Correct README template grammar. Signed-off-by: Matthew Field <fieldm58@gmail.com>

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 1eb722d..de9b2c5 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -34,6 +34,7 @@ cli:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 # controllers
 
@@ -82,6 +83,7 @@ helmcontroller:
   #     effect: NoSchedule
 
   tolerations: []
+  extraEnv: []
 
 imageautomationcontroller:
   create: true
@@ -108,6 +110,7 @@ imageautomationcontroller:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 imagereflectorcontroller:
   create: true
@@ -134,6 +137,7 @@ imagereflectorcontroller:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 kustomizecontroller:
   create: true
@@ -180,6 +184,7 @@ kustomizecontroller:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 notificationcontroller:
   create: true
@@ -213,6 +218,7 @@ notificationcontroller:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 sourcecontroller:
   create: true
```

## 1.6.0

**Release date:** 2022-10-06

![AppVersion: 0.35.0](https://img.shields.io/static/v1?label=AppVersion&message=0.35.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* chore(update) update to AppVersion 0.35.0 (#127)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 8e5b7ac..1eb722d 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -30,7 +30,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.34.0
+  tag: v0.35.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -40,7 +40,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.24.0
+  tag: v0.25.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -86,7 +86,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.25.0
+  tag: v0.26.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -112,7 +112,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.21.0
+  tag: v0.22.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -138,7 +138,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.28.0
+  tag: v0.29.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -184,7 +184,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.26.0
+  tag: v0.27.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -217,7 +217,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.29.0
+  tag: v0.30.0
   resources:
     limits: {}
     # cpu: 1000m
```

## 1.5.1

**Release date:** 2022-09-27

![AppVersion: 0.34.0](https://img.shields.io/static/v1?label=AppVersion&message=0.34.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix: set events-addr only when notification contorller is set to create (#125)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 5f0e7d8..8e5b7ac 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,6 +25,7 @@ multitenancy:
 # domain they need to mention `notifications-controller` explicitly in
 # `no_proxy` variable after debugging http proxy logs
 # eg: http://notification-controller.[NAMESPACE].svc.[CLUSTERDOMAIN]
+# if notification controller is disabled this is not set
 eventsaddr: http://notification-controller/
 
 cli:
```

## 1.5.0

**Release date:** 2022-09-27

![AppVersion: 0.34.0](https://img.shields.io/static/v1?label=AppVersion&message=0.34.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* chore(update) update to AppVersion 0.34.0 (#123)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index d2033b1..5f0e7d8 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -29,7 +29,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.33.0
+  tag: v0.34.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -39,7 +39,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.23.1
+  tag: v0.24.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -85,7 +85,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.24.2
+  tag: v0.25.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -111,7 +111,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.20.1
+  tag: v0.21.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -137,7 +137,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.27.1
+  tag: v0.28.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -183,7 +183,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.25.2
+  tag: v0.26.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -216,7 +216,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.28.0
+  tag: v0.29.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -284,6 +284,7 @@ extraObjects: []
 # Enables podMonitor creation for the Prometheus Operator
 prometheus:
   podMonitor:
+    # -- Enables podMonitor endpoint
     create: false
     podMetricsEndpoints:
       - port: http-prom
```

## 1.4.0

**Release date:** 2022-09-20

![AppVersion: 0.33.0](https://img.shields.io/static/v1?label=AppVersion&message=0.33.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat: Add multitenancy privileged mode (#112)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 8af79c7..d2033b1 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -11,6 +11,10 @@ multitenancy:
   # Tenants have to specify a service account in their Flux resources to be able
   # to deploy workloads in their namespaces as the default account has no permissions.
   defaultServiceAccount: "default"
+  # -- Both kustomize-controller and helm-controller service accounts run privileged
+  # with cluster-admin ClusterRoleBinding. Disable if you want to run them with a
+  # minimum set of permissions.
+  privileged: true
 
 # -- Maybe you need to use full domain name here, if you deploy flux
 # in environments that use http proxy.
```

## 1.3.0

**Release date:** 2022-09-05

![AppVersion: 0.33.0](https://img.shields.io/static/v1?label=AppVersion&message=0.33.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat: add imagePullPolicy to all controllers (#115)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 5849da0..8af79c7 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -53,6 +53,7 @@ helmcontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   nodeSelector: {}
   # expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#affinity-v1-core
   # for example:
@@ -98,6 +99,7 @@ imageautomationcontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -123,6 +125,7 @@ imagereflectorcontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -148,6 +151,7 @@ kustomizecontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   secret:
     # -- Create a secret to use it with extraSecretMounts. Defaults to false.
     create: false
@@ -193,6 +197,7 @@ notificationcontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   service:
     labels: {}
     annotations: {}
@@ -225,6 +230,7 @@ sourcecontroller:
   serviceaccount:
     create: true
     annotations: {}
+  imagePullPolicy: {}
   service:
     labels: {}
     annotations: {}
```

## 1.2.2

**Release date:** 2022-09-05

![AppVersion: 0.33.0](https://img.shields.io/static/v1?label=AppVersion&message=0.33.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Filter out non-running pods in Prometheus (#121)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 4a72fe3..5849da0 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -275,3 +275,10 @@ extraObjects: []
 prometheus:
   podMonitor:
     create: false
+    podMetricsEndpoints:
+      - port: http-prom
+        relabelings:
+          # https://github.com/prometheus-operator/prometheus-operator/issues/4816
+          - sourceLabels: [__meta_kubernetes_pod_phase]
+            action: keep
+            regex: Running
```

## 1.2.1

**Release date:** 2022-09-05

![AppVersion: 0.33.0](https://img.shields.io/static/v1?label=AppVersion&message=0.33.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat: add priorityclass

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 3bfa39b..4a72fe3 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -43,6 +43,7 @@ helmcontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
@@ -87,6 +88,7 @@ imageautomationcontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
@@ -111,6 +113,7 @@ imagereflectorcontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
@@ -135,6 +138,7 @@ kustomizecontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
@@ -179,6 +183,7 @@ notificationcontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
@@ -210,6 +215,7 @@ sourcecontroller:
     requests:
       cpu: 100m
       memory: 64Mi
+  priorityClassName: ""
   annotations:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
```

## 1.2.0

**Release date:** 2022-09-01

![AppVersion: 0.33.0](https://img.shields.io/static/v1?label=AppVersion&message=0.33.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat(update): update to AppVersion 0.33.0

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 53721de..3bfa39b 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.32.0
+  tag: v0.33.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.22.2
+  tag: v0.23.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.24.1
+  tag: v0.24.2
   resources:
     limits: {}
     # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.20.0
+  tag: v0.20.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.27.0
+  tag: v0.27.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.25.1
+  tag: v0.25.2
   resources:
     limits: {}
     # cpu: 1000m
@@ -202,7 +202,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.26.1
+  tag: v0.28.0
   resources:
     limits: {}
     # cpu: 1000m
```

## 1.1.0

**Release date:** 2022-08-23

![AppVersion: 0.32.0](https://img.shields.io/static/v1?label=AppVersion&message=0.32.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.32.0 (#116)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 9e19c85..53721de 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.31.3
+  tag: v0.32.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.22.1
+  tag: v0.22.2
   resources:
     limits: {}
     # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.23.4
+  tag: v0.24.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.19.2
+  tag: v0.20.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.26.2
+  tag: v0.27.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.24.0
+  tag: v0.25.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -202,7 +202,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.25.9
+  tag: v0.26.1
   resources:
     limits: {}
     # cpu: 1000m
```

## 1.0.0

**Release date:** 2022-07-07

![AppVersion: 0.31.3](https://img.shields.io/static/v1?label=AppVersion&message=0.31.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.31.3 (#109)
* artifacthub changes
* v0.31.1
* fixing chart version in readmes

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index c2286f1..9e19c85 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.31.0
+  tag: v0.31.3
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.22.0
+  tag: v0.22.1
   resources:
     limits: {}
     # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.23.0
+  tag: v0.23.4
   resources:
     limits: {}
     # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.19.0
+  tag: v0.19.2
   resources:
     limits: {}
     # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.26.0
+  tag: v0.26.2
   resources:
     limits: {}
     # cpu: 1000m
@@ -202,7 +202,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.25.3
+  tag: v0.25.9
   resources:
     limits: {}
     # cpu: 1000m
```

## 0.20.0

**Release date:** 2022-06-07

![AppVersion: 0.31.0](https://img.shields.io/static/v1?label=AppVersion&message=0.31.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* minor version bump for flux2

### Default value changes

```diff
# No changes in this release
```

## 0.19.3

**Release date:** 2022-06-07

![AppVersion: 0.31.0](https://img.shields.io/static/v1?label=AppVersion&message=0.31.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Update to 0.31.0

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index b8713e5..c2286f1 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.30.2
+  tag: v0.31.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.21.0
+  tag: v0.22.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.22.1
+  tag: v0.23.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.18.0
+  tag: v0.19.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.25.0
+  tag: v0.26.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.23.5
+  tag: v0.24.0
   resources:
     limits: {}
     # cpu: 1000m
@@ -202,7 +202,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.24.4
+  tag: v0.25.3
   resources:
     limits: {}
     # cpu: 1000m
```

## 0.19.2

**Release date:** 2022-05-04

![AppVersion: 0.30.2](https://img.shields.io/static/v1?label=AppVersion&message=0.30.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* build: update release to push to ghcr

### Default value changes

```diff
# No changes in this release
```

## 0.19.1

**Release date:** 2022-05-11

![AppVersion: 0.30.2](https://img.shields.io/static/v1?label=AppVersion&message=0.30.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* chore(version) bump version to trigger release (#98)

### Default value changes

```diff
# No changes in this release
```

## 0.19.0

**Release date:** 2022-05-10

![AppVersion: 0.30.2](https://img.shields.io/static/v1?label=AppVersion&message=0.30.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.30.2

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 40a7c43..b8713e5 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.29.1
+  tag: v0.30.2
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,11 +35,11 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.20.1
+  tag: v0.21.0
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -79,11 +79,11 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.22.0
+  tag: v0.22.1
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -103,11 +103,11 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.17.2
+  tag: v0.18.0
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -127,11 +127,11 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.24.3
+  tag: v0.25.0
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -158,11 +158,11 @@ kustomizecontroller:
   # -- Defines additional mounts with secrets.
   # Secrets must be manually created in the namespace or with kustomizecontroller.secret
   extraSecretMounts: []
-    # - name: secret-files
-    #   mountPath: /etc/secrets
-    #   subPath: ""
-    #   secretName: secret-files
-    #   readOnly: true
+  # - name: secret-files
+  #   mountPath: /etc/secrets
+  #   subPath: ""
+  #   secretName: secret-files
+  #   readOnly: true
 
   nodeSelector: {}
   affinity: {}
@@ -171,11 +171,11 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.23.4
+  tag: v0.23.5
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -202,11 +202,11 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.24.1
+  tag: v0.24.4
   resources:
     limits: {}
-      # cpu: 1000m
-      # memory: 1Gi
+    # cpu: 1000m
+    # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -242,28 +242,28 @@ imagePullSecrets: []
 # -- Array of extra K8s manifests to deploy
 extraObjects: []
 # Example usage from https://fluxcd.io/docs/components/source/buckets/#static-authentication
-  # - apiVersion: source.toolkit.fluxcd.io/v1beta1
-  #   kind: Bucket
-  #   metadata:
-  #     name: podinfo
-  #     namespace: default
-  #   spec:
-  #     interval: 1m
-  #     provider: generic
-  #     bucketName: podinfo
-  #     endpoint: minio.minio.svc.cluster.local:9000
-  #     insecure: true
-  #     secretRef:
-  #       name: minio-credentials
-  # - apiVersion: v1
-  #   kind: Secret
-  #   metadata:
-  #     name: minio-credentials
-  #     namespace: default
-  #   type: Opaque
-  #   data:
-  #     accesskey: <BASE64>
-  #     secretkey: <BASE64>
+# - apiVersion: source.toolkit.fluxcd.io/v1beta1
+#   kind: Bucket
+#   metadata:
+#     name: podinfo
+#     namespace: default
+#   spec:
+#     interval: 1m
+#     provider: generic
+#     bucketName: podinfo
+#     endpoint: minio.minio.svc.cluster.local:9000
+#     insecure: true
+#     secretRef:
+#       name: minio-credentials
+# - apiVersion: v1
+#   kind: Secret
+#   metadata:
+#     name: minio-credentials
+#     namespace: default
+#   type: Opaque
+#   data:
+#     accesskey: <BASE64>
+#     secretkey: <BASE64>
 
 # Enables podMonitor creation for the Prometheus Operator
 prometheus:
```

## 0.18.3

**Release date:** 2022-05-09

![AppVersion: 0.29.3](https://img.shields.io/static/v1?label=AppVersion&message=0.29.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Use port number in webhook service targetPort (#96)

### Default value changes

```diff
# No changes in this release
```

## 0.18.2

**Release date:** 2022-05-09

![AppVersion: 0.29.3](https://img.shields.io/static/v1?label=AppVersion&message=0.29.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Fix typo in notificationcontroller services annotations (#95)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 83476f9..40a7c43 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -190,11 +190,11 @@ notificationcontroller:
     annotations: {}
   service:
     labels: {}
-    annotation: {}
+    annotations: {}
   webhookReceiver:
     service:
       labels: {}
-      annotation: {}
+      annotations: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
```

## 0.18.1

**Release date:** 2022-05-04

![AppVersion: 0.29.3](https://img.shields.io/static/v1?label=AppVersion&message=0.29.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* chore(flux2): bump chart version
* feat(flux2-sync): update git repository resource to v1beta2

### Default value changes

```diff
# No changes in this release
```

## 0.18.0

**Release date:** 2022-04-22

![AppVersion: 0.29.3](https://img.shields.io/static/v1?label=AppVersion&message=0.29.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Allow custom labels and annotations for all services (#86)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 4d0c0e2..83476f9 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -190,6 +190,11 @@ notificationcontroller:
     annotations: {}
   service:
     labels: {}
+    annotation: {}
+  webhookReceiver:
+    service:
+      labels: {}
+      annotation: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -216,6 +221,7 @@ sourcecontroller:
     annotations: {}
   service:
     labels: {}
+    annotations: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
```

## 0.17.2

**Release date:** 2022-04-22

![AppVersion: 0.29.3](https://img.shields.io/static/v1?label=AppVersion&message=0.29.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.29.3 (#87)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 96362d0..4d0c0e2 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.24.2
+  tag: v0.24.3
   resources:
     limits: {}
       # cpu: 1000m
@@ -197,7 +197,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.24.0
+  tag: v0.24.1
   resources:
     limits: {}
       # cpu: 1000m
```

## 0.17.1

**Release date:** 2022-04-21

![AppVersion: 0.29.2](https://img.shields.io/static/v1?label=AppVersion&message=0.29.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.29.2 (#85)
* update image versions in values file

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index a0de099..96362d0 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.28.3
+  tag: v0.29.1
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.18.2
+  tag: v0.20.1
   resources:
     limits: {}
       # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.21.1
+  tag: v0.22.0
   resources:
     limits: {}
       # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.17.1
+  tag: v0.17.2
   resources:
     limits: {}
       # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.22.2
+  tag: v0.24.2
   resources:
     limits: {}
       # cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.23.1
+  tag: v0.23.4
   resources:
     limits: {}
       # cpu: 1000m
@@ -197,7 +197,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.22.3
+  tag: v0.24.0
   resources:
     limits: {}
       # cpu: 1000m
```

## 0.17.0

**Release date:** 2022-04-21

![AppVersion: 0.29.1](https://img.shields.io/static/v1?label=AppVersion&message=0.29.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update version strings in tests

### Default value changes

```diff
# No changes in this release
```

## 0.16.1

**Release date:** 2022-04-21

![AppVersion: 0.29.1](https://img.shields.io/static/v1?label=AppVersion&message=0.29.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.29.1
* newline
* fix podMonitor name

### Default value changes

```diff
# No changes in this release
```

## 0.16.0

**Release date:** 2022-04-01

![AppVersion: 0.28.3](https://img.shields.io/static/v1?label=AppVersion&message=0.28.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add podMonitor for Prometheus Operator

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 38db20f..a0de099 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -258,3 +258,8 @@ extraObjects: []
   #   data:
   #     accesskey: <BASE64>
   #     secretkey: <BASE64>
+
+# Enables podMonitor creation for the Prometheus Operator
+prometheus:
+  podMonitor:
+    create: false
```

## 0.15.0

**Release date:** 2022-03-28

![AppVersion: 0.28.3](https://img.shields.io/static/v1?label=AppVersion&message=0.28.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.28.3

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index f4f2256..38db20f 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.27.0
+  tag: v0.28.3
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.17.0
+  tag: v0.18.2
   resources:
     limits: {}
       # cpu: 1000m
@@ -79,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.20.0
+  tag: v0.21.1
   resources:
     limits: {}
       # cpu: 1000m
@@ -103,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.16.0
+  tag: v0.17.1
   resources:
     limits: {}
       # cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.21.0
+  tag: v0.22.2
   resources:
     limits: {}
       # cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.22.0
+  tag: v0.23.1
   resources:
     limits: {}
       # cpu: 1000m
@@ -197,7 +197,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.21.2
+  tag: v0.22.3
   resources:
     limits: {}
       # cpu: 1000m
```

## 0.14.1

**Release date:** 2022-03-23

![AppVersion: 0.27.0](https://img.shields.io/static/v1?label=AppVersion&message=0.27.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Fixed SecurityContext in notificaitonController Template (#81)

### Default value changes

```diff
# No changes in this release
```

## 0.14.0

**Release date:** 2022-03-02

![AppVersion: 0.27.0](https://img.shields.io/static/v1?label=AppVersion&message=0.27.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Do not set resource limits (#80)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index f6afd99..f4f2256 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -37,9 +37,9 @@ helmcontroller:
   image: ghcr.io/fluxcd/helm-controller
   tag: v0.17.0
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -81,9 +81,9 @@ imageautomationcontroller:
   image: ghcr.io/fluxcd/image-automation-controller
   tag: v0.20.0
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -105,9 +105,9 @@ imagereflectorcontroller:
   image: ghcr.io/fluxcd/image-reflector-controller
   tag: v0.16.0
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -129,9 +129,9 @@ kustomizecontroller:
   image: ghcr.io/fluxcd/kustomize-controller
   tag: v0.21.0
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -173,9 +173,9 @@ notificationcontroller:
   image: ghcr.io/fluxcd/notification-controller
   tag: v0.22.0
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
@@ -199,9 +199,9 @@ sourcecontroller:
   image: ghcr.io/fluxcd/source-controller
   tag: v0.21.2
   resources:
-    limits:
-      cpu: 1000m
-      memory: 1Gi
+    limits: {}
+      # cpu: 1000m
+      # memory: 1Gi
     requests:
       cpu: 100m
       memory: 64Mi
```

## 0.13.0

**Release date:** 2022-02-22

![AppVersion: 0.27.0](https://img.shields.io/static/v1?label=AppVersion&message=0.27.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.27.0 (#79)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 0753b64..f6afd99 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.26.2
+  tag: v0.27.0
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -35,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.16.0
+  tag: v0.17.0
   resources:
     limits:
       cpu: 1000m
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.20.2
+  tag: v0.21.0
   resources:
     limits:
       cpu: 1000m
@@ -171,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.21.0
+  tag: v0.22.0
   resources:
     limits:
       cpu: 1000m
```

## 0.12.1

**Release date:** 2022-02-12

![AppVersion: 0.26.3](https://img.shields.io/static/v1?label=AppVersion&message=0.26.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.26.3 (#77)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index b9f805c..0753b64 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.20.1
+  tag: v0.20.2
   resources:
     limits:
       cpu: 1000m
```

## 0.12.0

**Release date:** 2022-02-08

![AppVersion: 0.26.2](https://img.shields.io/static/v1?label=AppVersion&message=0.26.2&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.26.2 (#76)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 8e17fae..b9f805c 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -25,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.26.1
+  tag: v0.26.2
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -127,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.20.0
+  tag: v0.20.1
   resources:
     limits:
       cpu: 1000m
@@ -197,7 +197,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.21.1
+  tag: v0.21.2
   resources:
     limits:
       cpu: 1000m
```

## 0.11.0

**Release date:** 2022-02-07

![AppVersion: 0.26.1](https://img.shields.io/static/v1?label=AppVersion&message=0.26.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feature(update) update to AppVersion 0.26.1 (#75)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 27ed8ba..8e17fae 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -2,6 +2,16 @@
 
 installCRDs: true
 
+multitenancy:
+  # -- Implement the patches for Multi-tenancy lockdown.
+  # See https://fluxcd.io/docs/installation/#multi-tenancy-lockdown
+  enabled: false
+  # -- All Kustomizations and HelmReleases which don’t have spec.serviceAccountName
+  # specified, will use the default account from the tenant’s namespace.
+  # Tenants have to specify a service account in their Flux resources to be able
+  # to deploy workloads in their namespaces as the default account has no permissions.
+  defaultServiceAccount: "default"
+
 # -- Maybe you need to use full domain name here, if you deploy flux
 # in environments that use http proxy.
 #
@@ -15,7 +25,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.25.3
+  tag: v0.26.1
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -25,7 +35,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.15.0
+  tag: v0.16.0
   resources:
     limits:
       cpu: 1000m
@@ -69,7 +79,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.19.0
+  tag: v0.20.0
   resources:
     limits:
       cpu: 1000m
@@ -93,7 +103,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.15.0
+  tag: v0.16.0
   resources:
     limits:
       cpu: 1000m
@@ -117,7 +127,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.19.1
+  tag: v0.20.0
   resources:
     limits:
       cpu: 1000m
@@ -161,7 +171,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.20.1
+  tag: v0.21.0
   resources:
     limits:
       cpu: 1000m
@@ -187,7 +197,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.20.1
+  tag: v0.21.1
   resources:
     limits:
       cpu: 1000m
```

## 0.10.0

**Release date:** 2022-01-31

![AppVersion: 0.25.3](https://img.shields.io/static/v1?label=AppVersion&message=0.25.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat(flux2): Added ability to deploy extra K8s manifests (#72)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index f16cfe7..27ed8ba 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -222,3 +222,29 @@ watchallnamespaces: true
 
 # -- contents of pod imagePullSecret in form 'name=[secretName]'; applied to all controllers
 imagePullSecrets: []
+
+# -- Array of extra K8s manifests to deploy
+extraObjects: []
+# Example usage from https://fluxcd.io/docs/components/source/buckets/#static-authentication
+  # - apiVersion: source.toolkit.fluxcd.io/v1beta1
+  #   kind: Bucket
+  #   metadata:
+  #     name: podinfo
+  #     namespace: default
+  #   spec:
+  #     interval: 1m
+  #     provider: generic
+  #     bucketName: podinfo
+  #     endpoint: minio.minio.svc.cluster.local:9000
+  #     insecure: true
+  #     secretRef:
+  #       name: minio-credentials
+  # - apiVersion: v1
+  #   kind: Secret
+  #   metadata:
+  #     name: minio-credentials
+  #     namespace: default
+  #   type: Opaque
+  #   data:
+  #     accesskey: <BASE64>
+  #     secretkey: <BASE64>
```

## 0.9.2

**Release date:** 2022-01-28

![AppVersion: 0.25.3](https://img.shields.io/static/v1?label=AppVersion&message=0.25.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add additional args to controllers (#70)
* Added missing eol

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 2dca126..f16cfe7 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -37,6 +37,8 @@ helmcontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
@@ -79,6 +81,8 @@ imageautomationcontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
@@ -101,6 +105,8 @@ imagereflectorcontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
@@ -123,6 +129,8 @@ kustomizecontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
@@ -165,6 +173,8 @@ notificationcontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
@@ -189,6 +199,8 @@ sourcecontroller:
     prometheus.io/port: "8080"
     prometheus.io/scrape: "true"
   labels: {}
+  container:
+    additionalargs: []
   serviceaccount:
     create: true
     annotations: {}
```

## 0.9.1

**Release date:** 2022-01-24

![AppVersion: 0.25.3](https://img.shields.io/static/v1?label=AppVersion&message=0.25.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Added ServiceAccount for pre-install-job

### Default value changes

```diff
# No changes in this release
```

## 0.9.0

**Release date:** 2022-01-20

![AppVersion: 0.25.3](https://img.shields.io/static/v1?label=AppVersion&message=0.25.3&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat(v0.25.3): bump for upstream release flux2 to v0.25.3 (#66)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index fbf4f2e..2dca126 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -15,7 +15,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.24.1
+  tag: v0.25.3
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -25,7 +25,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.14.1
+  tag: v0.15.0
   resources:
     limits:
       cpu: 1000m
@@ -67,7 +67,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.18.0
+  tag: v0.19.0
   resources:
     limits:
       cpu: 1000m
@@ -89,7 +89,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.14.0
+  tag: v0.15.0
   resources:
     limits:
       cpu: 1000m
@@ -111,7 +111,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.18.2
+  tag: v0.19.1
   resources:
     limits:
       cpu: 1000m
@@ -153,7 +153,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.19.0
+  tag: v0.20.1
   resources:
     limits:
       cpu: 1000m
@@ -177,7 +177,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.19.2
+  tag: v0.20.1
   resources:
     limits:
       cpu: 1000m
```

## 0.8.6

**Release date:** 2022-01-04

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add value sourcecontroller.extraEnv (#64)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 9d39c9e..fbf4f2e 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -197,6 +197,7 @@ sourcecontroller:
   nodeSelector: {}
   affinity: {}
   tolerations: []
+  extraEnv: []
 
 policies:
   create: true
```

## 0.8.5

**Release date:** 2021-12-22

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* made replicas optionally editable (useful for downscaling to replicas 0) and added loglevel option. (#58)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 30fc50b..9d39c9e 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -204,6 +204,7 @@ policies:
 rbac:
   create: true
 
+loglevel: info
 watchallnamespaces: true
 
 # -- contents of pod imagePullSecret in form 'name=[secretName]'; applied to all controllers
```

## 0.8.4

**Release date:** 2021-12-21

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* support setting of imagePullSecrets for all controllers #53 (#57)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 4f29a77..30fc50b 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -205,3 +205,6 @@ rbac:
   create: true
 
 watchallnamespaces: true
+
+# -- contents of pod imagePullSecret in form 'name=[secretName]'; applied to all controllers
+imagePullSecrets: []
```

## 0.8.3

**Release date:** 2021-12-20

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* chore: update Makefile and Readme (#56)

### Default value changes

```diff
# No changes in this release
```

## 0.8.2

**Release date:** 2021-12-20

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* added kustomizelist and a few optional settings. added spaces in values.yaml so helm-docs generates it correctly on my end (comments are taken from above the definition). (#55)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index d21d2e3..4f29a77 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -52,6 +52,7 @@ helmcontroller:
   #            operator: In
   #            values:
   #            - master
+
   affinity: {}
   # expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#toleration-v1-core
   # for example:
@@ -60,6 +61,7 @@ helmcontroller:
   #     operator: Equal
   #     value: master
   #     effect: NoSchedule
+
   tolerations: []
 
 imageautomationcontroller:
@@ -143,6 +145,7 @@ kustomizecontroller:
     #   subPath: ""
     #   secretName: secret-files
     #   readOnly: true
+
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -165,6 +168,8 @@ notificationcontroller:
   serviceaccount:
     create: true
     annotations: {}
+  service:
+    labels: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -187,6 +192,8 @@ sourcecontroller:
   serviceaccount:
     create: true
     annotations: {}
+  service:
+    labels: {}
   nodeSelector: {}
   affinity: {}
   tolerations: []
```

## 0.8.1

**Release date:** 2021-12-18

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Allow the use of shasums for images (#54)

### Default value changes

```diff
# No changes in this release
```

## 0.8.0

**Release date:** 2021-12-12

![AppVersion: 0.24.1](https://img.shields.io/static/v1?label=AppVersion&message=0.24.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat(0.24.1) added generator and bumped 0.24.0 to 0.24.1 (#45)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index faac4b9..d21d2e3 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -15,7 +15,7 @@ eventsaddr: http://notification-controller/
 
 cli:
   image: ghcr.io/fluxcd/flux-cli
-  tag: v0.24.0
+  tag: v0.24.1
   nodeSelector: {}
   affinity: {}
   tolerations: []
@@ -25,7 +25,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.14.0
+  tag: v0.14.1
   resources:
     limits:
       cpu: 1000m
@@ -109,7 +109,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.18.1
+  tag: v0.18.2
   resources:
     limits:
       cpu: 1000m
@@ -172,7 +172,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.19.0
+  tag: v0.19.2
   resources:
     limits:
       cpu: 1000m
```

## 0.7.2

**Release date:** 2021-12-10

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add option to specify envFrom for kustomize controller (#43)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 51edcbe..faac4b9 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -129,6 +129,12 @@ kustomizecontroller:
     create: false
     name: ""
     data: {}
+  # -- Defines envFrom using a configmap and/or secret.
+  envFrom:
+    map:
+      name: ""
+    secret:
+      name: ""
   # -- Defines additional mounts with secrets.
   # Secrets must be manually created in the namespace or with kustomizecontroller.secret
   extraSecretMounts: []
```

## 0.7.1

**Release date:** 2021-12-10

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Add option to disable watching all namespaces

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 8222c74..51edcbe 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -190,3 +190,5 @@ policies:
 
 rbac:
   create: true
+
+watchallnamespaces: true
```

## 0.7.0

**Release date:** 2021-12-09

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* add possibilty to add secrets for git; some fixes (#38)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index accefaf..8222c74 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -124,7 +124,13 @@ kustomizecontroller:
   serviceaccount:
     create: true
     annotations: {}
-  # Defines additional mounts with secrets. Secrets must be manually created in the namespace.
+  secret:
+    # -- Create a secret to use it with extraSecretMounts. Defaults to false.
+    create: false
+    name: ""
+    data: {}
+  # -- Defines additional mounts with secrets.
+  # Secrets must be manually created in the namespace or with kustomizecontroller.secret
   extraSecretMounts: []
     # - name: secret-files
     #   mountPath: /etc/secrets
```

## 0.6.4

**Release date:** 2021-12-07

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* add helm labels and nodeSelector for flux-cli job (#34)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index f55cddd..accefaf 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -16,6 +16,9 @@ eventsaddr: http://notification-controller/
 cli:
   image: ghcr.io/fluxcd/flux-cli
   tag: v0.24.0
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 # controllers
 
```

## 0.6.3

**Release date:** 2021-12-07

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* helm-docs (#33)

### Default value changes

```diff
# No changes in this release
```

## 0.6.2

**Release date:** 2021-12-03

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* bump chart version
* Remove duplicated key 'metadata'

### Default value changes

```diff
# No changes in this release
```

## 0.6.1

**Release date:** 2021-11-30

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix crds for 0.24.0 release (#30)

### Default value changes

```diff
# No changes in this release
```

## 0.6.0

**Release date:** 2021-11-30

![AppVersion: 0.24.0](https://img.shields.io/static/v1?label=AppVersion&message=0.24.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update to appversion 0.24.0 (#29)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index b0a0daf..f55cddd 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -22,7 +22,7 @@ cli:
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.13.0
+  tag: v0.14.0
   resources:
     limits:
       cpu: 1000m
@@ -62,7 +62,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.17.1
+  tag: v0.18.0
   resources:
     limits:
       cpu: 1000m
@@ -84,7 +84,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.13.2
+  tag: v0.14.0
   resources:
     limits:
       cpu: 1000m
@@ -106,7 +106,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.18.0
+  tag: v0.18.1
   resources:
     limits:
       cpu: 1000m
@@ -135,7 +135,7 @@ kustomizecontroller:
 notificationcontroller:
   create: true
   image: ghcr.io/fluxcd/notification-controller
-  tag: v0.18.1
+  tag: v0.19.0
   resources:
     limits:
       cpu: 1000m
@@ -157,7 +157,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.18.0
+  tag: v0.19.0
   resources:
     limits:
       cpu: 1000m
```

## 0.5.0

**Release date:** 2021-11-29

![AppVersion: 0.23.0](https://img.shields.io/static/v1?label=AppVersion&message=0.23.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Added Pre- and Post-Install Hook (#24)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 72c81df..b0a0daf 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -13,6 +13,9 @@ installCRDs: true
 # eg: http://notification-controller.[NAMESPACE].svc.[CLUSTERDOMAIN]
 eventsaddr: http://notification-controller/
 
+cli:
+  image: ghcr.io/fluxcd/flux-cli
+  tag: v0.24.0
 
 # controllers
 
```

## 0.4.1

**Release date:** 2021-11-18

![AppVersion: 0.23.0](https://img.shields.io/static/v1?label=AppVersion&message=0.23.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* fix labels on pods (#20)

### Default value changes

```diff
# No changes in this release
```

## 0.4.0

**Release date:** 2021-11-16

![AppVersion: 0.23.0](https://img.shields.io/static/v1?label=AppVersion&message=0.23.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update to appversion 0.23.0 (#17)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 4132d13..72c81df 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -19,7 +19,7 @@ eventsaddr: http://notification-controller/
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
-  tag: v0.12.1
+  tag: v0.13.0
   resources:
     limits:
       cpu: 1000m
@@ -59,7 +59,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.16.1
+  tag: v0.17.1
   resources:
     limits:
       cpu: 1000m
@@ -81,7 +81,7 @@ imageautomationcontroller:
 imagereflectorcontroller:
   create: true
   image: ghcr.io/fluxcd/image-reflector-controller
-  tag: v0.13.0
+  tag: v0.13.2
   resources:
     limits:
       cpu: 1000m
@@ -103,7 +103,7 @@ imagereflectorcontroller:
 kustomizecontroller:
   create: true
   image: ghcr.io/fluxcd/kustomize-controller
-  tag: v0.16.0
+  tag: v0.18.0
   resources:
     limits:
       cpu: 1000m
@@ -154,7 +154,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.17.2
+  tag: v0.18.0
   resources:
     limits:
       cpu: 1000m
```

## 0.3.2

**Release date:** 2021-11-09

![AppVersion: 0.21.1](https://img.shields.io/static/v1?label=AppVersion&message=0.21.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* add chart flux-sync (#15)

### Default value changes

```diff
# No changes in this release
```

## 0.3.1

**Release date:** 2021-11-08

![AppVersion: 0.21.1](https://img.shields.io/static/v1?label=AppVersion&message=0.21.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Changelog (#14)

### Default value changes

```diff
# No changes in this release
```

## 0.3.0

**Release date:** 2021-11-07

![AppVersion: 0.21.1](https://img.shields.io/static/v1?label=AppVersion&message=0.21.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update to 0.21.1 and add unittests (#13)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index adc43c6..4132d13 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -1,5 +1,21 @@
+# global
+
 installCRDs: true
 
+# -- Maybe you need to use full domain name here, if you deploy flux
+# in environments that use http proxy.
+#
+# In such environments they normally add `.cluster.local` and `.local`
+# suffixes to `no_proxy` variable in order to prevent cluster-local
+# traffic from going through http proxy. Without fully specified
+# domain they need to mention `notifications-controller` explicitly in
+# `no_proxy` variable after debugging http proxy logs
+# eg: http://notification-controller.[NAMESPACE].svc.[CLUSTERDOMAIN]
+eventsaddr: http://notification-controller/
+
+
+# controllers
+
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
@@ -43,7 +59,7 @@ helmcontroller:
 imageautomationcontroller:
   create: true
   image: ghcr.io/fluxcd/image-automation-controller
-  tag: v0.16.0
+  tag: v0.16.1
   resources:
     limits:
       cpu: 1000m
@@ -138,7 +154,7 @@ notificationcontroller:
 sourcecontroller:
   create: true
   image: ghcr.io/fluxcd/source-controller
-  tag: v0.17.1
+  tag: v0.17.2
   resources:
     limits:
       cpu: 1000m
```

## 0.2.2

**Release date:** 2021-11-05

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* seperate files & make condition for crds (#11)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 0a23b87..adc43c6 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -1,3 +1,5 @@
+installCRDs: true
+
 helmcontroller:
   create: true
   image: ghcr.io/fluxcd/helm-controller
@@ -14,6 +16,7 @@ helmcontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   nodeSelector: {}
   # expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#affinity-v1-core
@@ -53,6 +56,7 @@ imageautomationcontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   nodeSelector: {}
   affinity: {}
@@ -74,6 +78,7 @@ imagereflectorcontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   nodeSelector: {}
   affinity: {}
@@ -95,6 +100,7 @@ kustomizecontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   # Defines additional mounts with secrets. Secrets must be manually created in the namespace.
   extraSecretMounts: []
@@ -123,6 +129,7 @@ notificationcontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   nodeSelector: {}
   affinity: {}
@@ -144,6 +151,7 @@ sourcecontroller:
     prometheus.io/scrape: "true"
   labels: {}
   serviceaccount:
+    create: true
     annotations: {}
   nodeSelector: {}
   affinity: {}
```

## 0.2.1

**Release date:** 2021-11-04

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* Patch 1 (#10)

### Default value changes

```diff
# No changes in this release
```

## 0.2.0

**Release date:** 2021-11-04

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* extend values for nodeselctor, affinity and tolerations (#9)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 710f4f8..0a23b87 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -15,6 +15,27 @@ helmcontroller:
   labels: {}
   serviceaccount:
     annotations: {}
+  nodeSelector: {}
+  # expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#affinity-v1-core
+  # for example:
+  #   affinity:
+  #     nodeAffinity:
+  #      requiredDuringSchedulingIgnoredDuringExecution:
+  #        nodeSelectorTerms:
+  #        - matchExpressions:
+  #          - key: foo.bar.com/role
+  #            operator: In
+  #            values:
+  #            - master
+  affinity: {}
+  # expects input structure as per specification https://kubernetes.io/docs/reference/generated/kubernetes-api/v1.11/#toleration-v1-core
+  # for example:
+  #   tolerations:
+  #   - key: foo.bar.com/role
+  #     operator: Equal
+  #     value: master
+  #     effect: NoSchedule
+  tolerations: []
 
 imageautomationcontroller:
   create: true
@@ -33,6 +54,9 @@ imageautomationcontroller:
   labels: {}
   serviceaccount:
     annotations: {}
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 imagereflectorcontroller:
   create: true
@@ -51,6 +75,9 @@ imagereflectorcontroller:
   labels: {}
   serviceaccount:
     annotations: {}
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 kustomizecontroller:
   create: true
@@ -76,6 +103,9 @@ kustomizecontroller:
     #   subPath: ""
     #   secretName: secret-files
     #   readOnly: true
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 notificationcontroller:
   create: true
@@ -94,6 +124,9 @@ notificationcontroller:
   labels: {}
   serviceaccount:
     annotations: {}
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 sourcecontroller:
   create: true
@@ -112,6 +145,9 @@ sourcecontroller:
   labels: {}
   serviceaccount:
     annotations: {}
+  nodeSelector: {}
+  affinity: {}
+  tolerations: []
 
 policies:
   create: true
```

## 0.1.1

**Release date:** 2021-11-04

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update image download source to use ghcr.io (#8)

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 29f3471..710f4f8 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -1,6 +1,6 @@
 helmcontroller:
   create: true
-  image: fluxcd/helm-controller
+  image: ghcr.io/fluxcd/helm-controller
   tag: v0.12.1
   resources:
     limits:
@@ -18,7 +18,7 @@ helmcontroller:
 
 imageautomationcontroller:
   create: true
-  image: fluxcd/image-automation-controller
+  image: ghcr.io/fluxcd/image-automation-controller
   tag: v0.16.0
   resources:
     limits:
@@ -36,7 +36,7 @@ imageautomationcontroller:
 
 imagereflectorcontroller:
   create: true
-  image: fluxcd/image-reflector-controller
+  image: ghcr.io/fluxcd/image-reflector-controller
   tag: v0.13.0
   resources:
     limits:
@@ -54,7 +54,7 @@ imagereflectorcontroller:
 
 kustomizecontroller:
   create: true
-  image: fluxcd/kustomize-controller
+  image: ghcr.io/fluxcd/kustomize-controller
   tag: v0.16.0
   resources:
     limits:
@@ -79,7 +79,7 @@ kustomizecontroller:
 
 notificationcontroller:
   create: true
-  image: fluxcd/notification-controller
+  image: ghcr.io/fluxcd/notification-controller
   tag: v0.18.1
   resources:
     limits:
@@ -97,7 +97,7 @@ notificationcontroller:
 
 sourcecontroller:
   create: true
-  image: fluxcd/source-controller
+  image: ghcr.io/fluxcd/source-controller
   tag: v0.17.1
   resources:
     limits:
```

## 0.1.0

**Release date:** 2021-11-03

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* extend configurable values for resources, annotations and mounts

### Default value changes

```diff
diff --git a/charts/flux2/values.yaml b/charts/flux2/values.yaml
index 0264666..29f3471 100644
--- a/charts/flux2/values.yaml
+++ b/charts/flux2/values.yaml
@@ -2,31 +2,116 @@ helmcontroller:
   create: true
   image: fluxcd/helm-controller
   tag: v0.12.1
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
 
 imageautomationcontroller:
   create: true
   image: fluxcd/image-automation-controller
   tag: v0.16.0
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
 
 imagereflectorcontroller:
   create: true
   image: fluxcd/image-reflector-controller
   tag: v0.13.0
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
 
 kustomizecontroller:
   create: true
   image: fluxcd/kustomize-controller
   tag: v0.16.0
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
+  # Defines additional mounts with secrets. Secrets must be manually created in the namespace.
+  extraSecretMounts: []
+    # - name: secret-files
+    #   mountPath: /etc/secrets
+    #   subPath: ""
+    #   secretName: secret-files
+    #   readOnly: true
 
 notificationcontroller:
   create: true
   image: fluxcd/notification-controller
   tag: v0.18.1
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
 
 sourcecontroller:
   create: true
   image: fluxcd/source-controller
   tag: v0.17.1
+  resources:
+    limits:
+      cpu: 1000m
+      memory: 1Gi
+    requests:
+      cpu: 100m
+      memory: 64Mi
+  annotations:
+    prometheus.io/port: "8080"
+    prometheus.io/scrape: "true"
+  labels: {}
+  serviceaccount:
+    annotations: {}
 
 policies:
   create: true
```

## 0.0.1

**Release date:** 2021-11-02

![AppVersion: 0.20.1](https://img.shields.io/static/v1?label=AppVersion&message=0.20.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* feat(initial): release initial helm-chart to start community work

### Default value changes

```diff
helmcontroller:
  create: true
  image: fluxcd/helm-controller
  tag: v0.12.1

imageautomationcontroller:
  create: true
  image: fluxcd/image-automation-controller
  tag: v0.16.0

imagereflectorcontroller:
  create: true
  image: fluxcd/image-reflector-controller
  tag: v0.13.0

kustomizecontroller:
  create: true
  image: fluxcd/kustomize-controller
  tag: v0.16.0

notificationcontroller:
  create: true
  image: fluxcd/notification-controller
  tag: v0.18.1

sourcecontroller:
  create: true
  image: fluxcd/source-controller
  tag: v0.17.1

policies:
  create: true

rbac:
  create: true
```

---
Autogenerated from Helm Chart and git history using [helm-changelog](https://github.com/mogensen/helm-changelog)
