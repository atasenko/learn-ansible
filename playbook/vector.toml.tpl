# Managed by Ansible. All changes will be overwritten.
data_dir = "{{ vector_data_dir }}"

{% for app in vector_apps %}
[sources.{{ app.app_name }}_logs]
type         = "{{ app.source_type }}"
include      = "{{ app.logs_path }}"

[transforms.{{ app.app_name }}_parser]
inputs       = ["{{ app.app_name }}_logs"]
type         = "{{ app.trans_type }}"
condition    = "{{ app.condition }}"

[sinks.clickhouse]
type         = "clickhouse"
inputs       = ["{{ app.app_name }}_parser"]
endpoint     = "http://localhost:9000"
table        = "{{ app.app_name }}"
{% endfor %}
