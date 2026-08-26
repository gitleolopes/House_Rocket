WITH orders AS(
    SELECT * FROM {{ ref('stg_jaffle_shop__orders') }}
)
{#
, pivoted AS(
    SELECT order_id
    ,COUNT(CASE WHEN order_status = 'completed' THEN customer_id ELSE 0 END) AS qtd_customer_completed
    FROM orders
    GROUP BY order_id
)
#}

,pivoted AS(
    SELECT order_id
    {% set order_status = ['completed', 'placed', 'shipped', 'returned', 'return_pending'] -%}
    {%- for order_statu in order_status -%}
        ,COUNT(CASE WHEN order_status = '{{order_statu}}' THEN customer_id ELSE 0 END) AS qtd_customer_{{order_statu}}
    {% endfor %}
    FROM orders
    GROUP BY order_id
)

SELECT * FROM pivoted