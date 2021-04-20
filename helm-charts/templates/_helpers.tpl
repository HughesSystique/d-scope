{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "dvof.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "dvof.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "dvof.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "dvof.labels" -}}
app.kubernetes.io/name: {{ include "dvof.name" . }}
helm.sh/chart: {{ include "dvof.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "dvof.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "dvof.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create unified labels for dvof components
*/}}
{{- define "dvof.common.matchLabels" -}}
release: {{ .Release.Name }}
{{- end -}}

{{- define "dvof.common.metaLabels" -}}
chart: {{ template "dvof.chart" . }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "dvof.nsmgr.labels" -}}
{{ include "dvof.nsmgr.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.nsmgr.matchLabels" -}}
app: {{ .Values.nsmgr.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified nsmgr name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.nsmgr.fullname" -}}
{{- if .Values.nsmgr.fullnameOverride -}}
{{- .Values.nsmgr.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.nsmgr.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.nsmgr.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{- define "dvof.opennessmgr.labels" -}}
{{ include "dvof.opennessmgr.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.opennessmgr.matchLabels" -}}
app: {{ .Values.opennessmgr.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified openness name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.opennessmgr.fullname" -}}
{{- if .Values.opennessmgr.fullnameOverride -}}
{{- .Values.opennessmgr.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.opennessmgr.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.opennessmgr.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{- define "dvof.openstackmgr.labels" -}}
{{ include "dvof.openstackmgr.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.openstackmgr.matchLabels" -}}
app: {{ .Values.openstackmgr.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified openstackmgr name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.openstackmgr.fullname" -}}
{{- if .Values.openstackmgr.fullnameOverride -}}
{{- .Values.openstackmgr.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.openstackmgr.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.openstackmgr.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{- define "dvof.sdncmgr.labels" -}}
{{ include "dvof.sdncmgr.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.sdncmgr.matchLabels" -}}
app: {{ .Values.sdncmgr.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified sdncmgr name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.sdncmgr.fullname" -}}
{{- if .Values.sdncmgr.fullnameOverride -}}
{{- .Values.sdncmgr.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.sdncmgr.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.sdncmgr.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}






{{- define "dvof.sitemgr.labels" -}}
{{ include "dvof.sitemgr.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.sitemgr.matchLabels" -}}
app: {{ .Values.sitemgr.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified sitemgr name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.sitemgr.fullname" -}}
{{- if .Values.sitemgr.fullnameOverride -}}
{{- .Values.sitemgr.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.sitemgr.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.sitemgr.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{- define "dvof.frontend.labels" -}}
{{ include "dvof.frontend.matchLabels" . }}
{{ include "dvof.common.metaLabels" . }}
{{- end -}}

{{- define "dvof.frontend.matchLabels" -}}
app: {{ .Values.frontend.name | quote }}
version: v1
{{ include "dvof.common.matchLabels" . }}
{{- end -}}

{{/*
Create a fully qualified frontend name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.frontend.fullname" -}}
{{- if .Values.frontend.fullnameOverride -}}
{{- .Values.frontend.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.frontend.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}



{{/*
Create a fully qualified etcd name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}

{{- define "dvof.etcd.fullname" -}}
{{- if .Values.etcd.fullnameOverride -}}
{{- .Values.etcd.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.etcd.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.etcd.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}


{{/*
Define the dvof.namespace template if set with forceNamespace or .Release.Namespace is set
*/}}
{{- define "dvof.namespace" -}}
{{- if .Values.forceNamespace -}}
{{ printf "namespace: %s" .Values.forceNamespace }}
{{- else -}}
{{ printf "namespace: %s" .Release.Namespace }}
{{- end -}}
{{- end -}}
                 
