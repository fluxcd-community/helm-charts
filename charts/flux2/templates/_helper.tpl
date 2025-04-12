{{- define "template.image" -}}
{{- if eq (substr 0 7 .tag) "sha256:" -}}
{{- printf "%s@%s" .image .tag -}}
{{- else -}}
{{- printf "%s:%s" .image .tag -}}
{{- end -}}
{{- end -}}

{{/*
Namespace for all resources to be installed into
If not defined in values file then the helm release namespace is used
By default this is not set so the helm release namespace will be used
This gets around an problem within helm discussed here
https://github.com/helm/helm/issues/5358
*/}}
{{- define "flux.namespace" -}}
    {{ .Values.namespace | default .Release.Namespace }}
{{- end -}}
