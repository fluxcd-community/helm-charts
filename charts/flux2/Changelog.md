# Change Log

## 0.3.1

**Release date:** 2021-11-08

![AppVersion: 0.21.1](https://img.shields.io/static/v1?label=AppVersion&message=0.21.1&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)


* update contributing docs and add chart changelog

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
