{#
{% for j in range(5) %}
    select {{j}} as number {% if not loop.last %} union all {% endif %} 
{% endfor %}
#}
{# not loop.last -> this is not the last loop  #}
{#
{% set cool_string = 'This is Jinja' %}
{% set my_fav_num = 7 %}

{{cool_string}} I want to write Jinja for {{my_fav_num}} years!
#}

{#
{% set animals = ["Dog", "Cat", "Bird"] %}

{{ animals[0] }}
{{ animals[1] }}
{{ animals[2] }}

{% for animal in animals %} 
my favorite animal is the {{ animal }} 
{% endfor %}
#}

{%- set foods = ['banana', 'strowberry', 'chicken nugget', 'passion fruit'] -%}

{%- for food  in foods -%}
    {%- if food == 'chicken nugget' -%}
        {%- set food_type = 'snack' -%}
    
    {%-else-%}
        {%- set food_type = 'fruit' -%}

    {%- endif -%}

    The delicious {{food}} is my favorite {{food_type}}
{% endfor %}