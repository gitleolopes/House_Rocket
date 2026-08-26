WITH payments AS(
    SELECT * FROM {{ ref('stg_stripe__payment') }}
    WHERE payment_status = 'success'
)
{#
, pivoted AS(
    SELECT order_id
    ,SUM(CASE WHEN payment_method = 'bank_transfer' THEN amount ELSE 0 END) AS bank_transfer_amount
    ,SUM(CASE WHEN payment_method = 'coupon' THEN amount ELSE 0 END) AS coupon_amount
    ,SUM(CASE WHEN payment_method = 'credit_card' THEN amount ELSE 0 END) AS credit_card_amount
    ,SUM(CASE WHEN payment_method = 'gift_card' THEN amount ELSE 0 END) AS gift_card_amount
    FROM payments
    GROUP BY order_id
    ORDER BY order_id
)
#}

,pivoted AS(
    SELECT order_id,
    {%- set payment_methods = ['bank_transfer', 'coupon', 'credit_card', 'gift_card'] -%}
    {%- for payment_method in payment_methods -%}
        SUM(CASE WHEN payment_method = '{{payment_method}}' THEN amount ELSE 0 END) AS {{payment_method}}_amount{% if not loop.last %}, {% endif %}
    {% endfor %}
    FROM payments
    GROUP BY order_id
)

SELECT * FROM pivoted