{% macro limit_data_dev() %}
{% if target.name = 'dev' %}
where collector_tstamp >= dateadd('day', -3, current_timestamp)
{% endif %}
{% endmacro %}