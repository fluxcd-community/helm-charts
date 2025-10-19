{{- define "template.image" -}}
{{- if eq (substr 0 7 .tag) "sha256:" -}}
{{- printf "%s@%s" .image .tag -}}
{{- else -}}
{{- printf "%s:%s" .image .tag -}}
{{- end -}}
{{- end -}}

{{/*
Return the namespace for this release.
*/}}
{{- define "flux.namespace" -}}
{{- .Values.namespaceOverride | default .Release.Namespace -}}
{{- end -}}
