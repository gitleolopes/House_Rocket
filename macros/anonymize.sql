{% macro anonymize(column_name) -%}
    to_hex(sha256({{column_name}}))
{%- endmacro %}