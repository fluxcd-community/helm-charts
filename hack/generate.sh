#!/bin/bash -

TEMPDIR=$(mktemp -d tmp.generate.XXXXX)

delete_temp_dir() {
    if [ -d "${TEMPDIR}" ]; then
        rm -r "${TEMPDIR}"
    fi
}
trap delete_temp_dir EXIT

for FILE in `cat .work/flux2/manifests/crds/kustomization.yaml | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"`
do

cat <<EOF > "${TEMPDIR}/global-labels.yaml"
apiVersion: builtin
kind: LabelTransformer
metadata:
  name: global-labels
labels:
  app.kubernetes.io/instance: "{{ .Release.Namespace }}"
  app.kubernetes.io/managed-by: "{{ .Release.Service }}"
  app.kubernetes.io/version: "{{ .Chart.AppVersion }}"
  app.kubernetes.io/part-of: "flux"
  helm.sh/chart: "{{ .Chart.Name }}-{{ .Chart.Version | replace \"+\" \"_\" }}"
fieldSpecs:
- path: metadata/labels
  create: true
EOF

cat <<EOF > "${TEMPDIR}/kustomization.yaml"
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
   - ${FILE}
transformers:
   - global-labels.yaml
EOF

kubectl kustomize "${TEMPDIR}" > ./charts/flux2/templates/${FILE##*/}
echo -e "{{- if .Values.installCRDs }}\n$(cat ./charts/flux2/templates/${FILE##*/})" > ./charts/flux2/templates/${FILE##*/}
echo -e "$(cat ./charts/flux2/templates/${FILE##*/})\n{{- end }}" > ./charts/flux2/templates/${FILE##*/}


done
