
{% macro table_with_lower_columns(db_source, table_name) %}

{% set table_columns = adapter.get_columns_in_relation(source(db_source, table_name)) %}

select
    {%- for col in table_columns %}  
    "{{ col.name }}" as {{ col.name|lower }}{%- if not loop.last %},{% endif %}
    {%- endfor %}
from {{ source(db_source, table_name) }}

{% endmacro %}
