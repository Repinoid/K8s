{{/*
Helper template that returns the full name of the release
*/}}
{{- define "my-keycloak-chart.fullname" }}
{{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}