# Managed by Ansible. All changes will be overwritten.
data_dir: {{ vector_data_dir }}

{% for app in vector_apps %}
sources:
    {{ app.app_name }}:
        type: {{ app.source_type }}
        include:
            - {{ app.logs_path }}
sinks:
    clickhouse:
        type: clickhouse
        inputs: {{ app.app_name }}
        endpoints: "http://10.0.1.15:9000"
        table: {{ app.app_name }}
{% endfor %}
