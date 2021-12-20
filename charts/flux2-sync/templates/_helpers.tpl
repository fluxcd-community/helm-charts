{{- define "pathToKustomizationName" -}}
{{ print .releasename "-" ( regexReplaceAll "\\W+" (clean .pathtoconvert ) "-" ) }}
{{- end -}}
