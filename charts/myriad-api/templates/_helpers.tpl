{{/*
Expand the name of the chart.
*/}}
{{- define "myriad-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "myriad-api.fullname" -}}
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
{{- define "myriad-api.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "myriad-api.labels" -}}
helm.sh/chart: {{ include "myriad-api.chart" . }}
{{ include "myriad-api.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "myriad-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "myriad-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "myriad-api.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "myriad-api.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of admin substrate secret.
*/}}
{{- define "myriad-api.adminSubstrateSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "adminsubstrate" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of admin near secret.
*/}}
{{- define "myriad-api.adminNearSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "adminnear" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of jwt secret.
*/}}
{{- define "myriad-api.jwtSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "jwt" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of mongo secret.
*/}}
{{- define "myriad-api.mongoSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "mongo" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of redis secret.
*/}}
{{- define "myriad-api.redisSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "redis" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of smtp secret.
*/}}
{{- define "myriad-api.smtpSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "smtp" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of firebase secret.
*/}}
{{- define "myriad-api.firebaseSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "firebase" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of sentry secret.
*/}}
{{- define "myriad-api.sentrySecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "sentry" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of twitter secret.
*/}}
{{- define "myriad-api.twitterSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "twitter" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create the name of coin market cap secret.
*/}}
{{- define "myriad-api.coinMarketCapSecretName" -}}
{{- printf "%s-%s" (include "myriad-api.fullname" .) "coinmarketcap" | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
