{{- define "pathToKustomizationName" -}}
{{ print "flux-kustomization-" ( regexReplaceAll "\\W+" (clean .pathtoconvert ) "-" | sha256sum | trunc 10  ) }}
{{- end -}}
