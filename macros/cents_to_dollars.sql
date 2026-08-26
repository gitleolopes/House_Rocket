{% macro cent_to_dollar(column_name, decimal = 2) -%}
    ROUND({{column_name}}/100, {{decimal}})
{%- endmacro %}