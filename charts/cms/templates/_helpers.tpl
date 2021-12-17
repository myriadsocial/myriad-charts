{{/*
Expand the name of the chart.
*/}}
{{- define "myriad-cms.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "myriad-cms.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "myriad-cms.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "myriad-cms.labels" -}}
helm.sh/chart: {{ include "myriad-cms.chart" . }}
{{ include "myriad-cms.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "myriad-cms.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myriad-cms.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "myriad-cms.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "myriad-cms.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of app Base Layout Config Key secret.
*/}}
{{- define "myriad-cms.appBaseLayoutConfigKeySecretName" -}}
{{- printf "%s-%s" (include "myriad-cms.fullname" .) "app-base-layout-config-key" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of app Api Url secret.
*/}}
{{- define "myriad-cms.appApiUrlSecretName" -}}
{{- printf "%s-%s" (include "myriad-cms.fullname" .) "app-api-url" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of app Web Url secret.
*/}}
{{- define "myriad-cms.appWebUrlSecretName" -}}
{{- printf "%s-%s" (include "myriad-cms.fullname" .) "app-web-url" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
