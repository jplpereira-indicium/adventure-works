-- dbt run-operation clean_up_specific_schema --args '{database_name: "my_catalog_name", schema_name: "my_schema_name"}'
{% macro clean_up_specific_schema(catalog_name, schema_name) %}
  {% set sql %}
    DROP SCHEMA IF EXISTS {{ catalog_name }}.{{ schema_name }} CASCADE;
  {% endset %}
  {% do run_query(sql) %}
  {{ log("Dropped schema " ~ schema_name, info = True) }}
{% endmacro %}