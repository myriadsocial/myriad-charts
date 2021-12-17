{{/*
Expand the name of the chart.
*/}}
{{- define "myriad-db.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "myriad-db.fullname" -}}
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
{{- define "myriad-db.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "myriad-db.labels" -}}
helm.sh/chart: {{ include "myriad-db.chart" . }}
{{ include "myriad-db.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "myriad-db.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myriad-db.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "myriad-db.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "myriad-db.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of mongo secret.
*/}}
{{- define "myriad-db.mongoSecretName" -}}
{{- printf "%s-%s" (include "myriad-db.fullname" .) "mongo" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of mongo init config map.
*/}}
{{- define "myriad-db.mongoInitConfigMapName" -}}
{{- printf "%s-%s" (include "myriad-db.fullname" .) "mongoinit" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of mongo key config map.
*/}}
{{- define "myriad-db.mongoKeyConfigMapName" -}}
{{- printf "%s-%s" (include "myriad-db.fullname" .) "mongokey" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of mongo script config map.
*/}}
{{- define "myriad-db.mongoScriptConfigMapName" -}}
{{- printf "%s-%s" (include "myriad-db.fullname" .) "mongoscript" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
