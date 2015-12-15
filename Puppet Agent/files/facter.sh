export box=$(basename $(find /var/elasticbox/ -type d -name "i-*"))

/usr/elasticbox/elasticbox config << ENVIRONMENT_YAML
{% for key, value in variables.items() %}{% if value and not value.address and not value is mapping %}
{{ key }}={{ value }}
{% endif %}{% endfor %}
ENVIRONMENT_YAML
