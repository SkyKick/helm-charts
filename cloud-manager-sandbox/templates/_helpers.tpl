{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "cloud-manager-sandbox.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "cloud-manager-sandbox.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "cloud-manager-sandbox.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "cloud-manager-sandbox.labels" -}}
helm.sh/chart: {{ include "cloud-manager-sandbox.chart" . }}
{{ include "cloud-manager-sandbox.selectorLabels" . }}
app.kubernetes.io/part-of: cloud-manager
app.kubernetes.io/service: sandbox
app.kubernetes.io/sandboxId: {{ .Values.sandboxId | quote }}
{{- end -}}

{{- define "cloud-manager-sandbox.ingress.annotations" -}}
kubernetes.io/ingress.class: "azure/application-gateway"
appgw.ingress.kubernetes.io/backend-path-prefix: "/"
appgw.ingress.kubernetes.io/backend-protocol: "http"
appgw.ingress.kubernetes.io/connection-draining: "true"
appgw.ingress.kubernetes.io/connection-draining-timeout: "60"
{{- if .Values.certificateName }}
appgw.ingress.kubernetes.io/appgw-ssl-certificate: {{ .Values.certificateName | quote }}
{{- end }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "cloud-manager-sandbox.selectorLabels" -}}
app.kubernetes.io/name: {{ include "cloud-manager-sandbox.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Image name
*/}}
{{- define "cloud-manager-sandbox.imageName" -}}
{{- if .Values.imageOverride -}}
{{-     .Values.imageOverride -}}
{{- else -}}
{{-     printf "%s/%s:%s-%s" .Values.image.repository .Values.image.name .Values.image.tag .Values.environment -}}
{{- end -}}
{{- end -}}
