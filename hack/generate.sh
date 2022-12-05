#!/bin/bash -

TEMPDIR=$(mktemp -d tmp.generate.XXXXX)
SED=$(which gsed || which sed)

delete_temp_dir() {
    if [ -d "${TEMPDIR}" ]; then
        rm -r "${TEMPDIR}"
    fi
}
trap delete_temp_dir EXIT


get_controller_values_attribute() {
  echo "$(echo $1 | cut -d '/' -f5 | sed 's/reflector/reflection/' | sed 's/-./\U&/g' | tr -d '-')"
}


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

attribute="$(get_controller_values_attribute ${FILE})"
echo "{{- if and .Values.installCRDs .Values.${attribute}.installCRDs }}" > ./charts/flux2/templates/${FILE##*/}
kubectl kustomize "${TEMPDIR}" >> ./charts/flux2/templates/${FILE##*/}
echo "{{- end }}">> ./charts/flux2/templates/${FILE##*/}

# git diff --quiet will exit 1 when there are changes.
if ! git diff --quiet HEAD main -- ./charts/flux2/templates/ ; then
  make update.chartversion chartyamlpath=./charts/flux2/Chart.yaml semvertype=minor
fi

done

#update values.yaml and snapshots
for FILE in `cat .work/flux2/manifests/crds/kustomization.yaml | grep -Eo "(http|https)://[a-zA-Z0-9./?=_%:-]*"`
do

attribute="$(get_controller_values_attribute ${FILE})"
diff -B ./charts/flux2/values.yaml <(controllerName="${attribute}"  controllerVersion=`echo $FILE | cut -d '/' -f8`  yq eval '.[env(controllerName)].tag = env(controllerVersion)' ./charts/flux2/values.yaml) | patch ./charts/flux2/values.yaml

# update unittest snapshots
controllerName=`echo $FILE | cut -d '/' -f5`
controllerVersion=`echo $FILE | cut -d '/' -f8`

$SED \
  -s -i "s/^\([[:space:]]\+image: ghcr\.io\/fluxcd\/${controllerName}:\).*/\1${controllerVersion}/" ./charts/flux2/tests/__snapshot__/*.yaml.snap

done

# Set cli image tag
diff -B ./charts/flux2/values.yaml <(fluxVersion=`grep 'FLUX2_VERSION ?= ' Makefile | cut -d ' ' -f3`  yq eval '.cli.tag = env(fluxVersion)' ./charts/flux2/values.yaml) | patch ./charts/flux2/values.yaml
