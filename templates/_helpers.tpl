{{/*
Create a default fully qualified app name: <ReleaseName>-<ChartName>
*/}}
{{- define "nginx-helm.fullname" -}}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Selector labels: 2 nhãn cốt lõi để Pod và Service bắt khớp nhau
*/}}
{{- define "nginx-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ .Chart.Name }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Common labels: metadata chuẩn gắn lên tất cả resource
*/}}
{{- define "nginx-helm.labels" -}}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{ include "nginx-helm.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
