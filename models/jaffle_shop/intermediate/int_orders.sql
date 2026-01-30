WITH orders AS(
    SELECT * FROM {{ref('stg_jaffle_shop__orders')}}
)

,payment AS(
    SELECT * FROM {{ref('stg_stripe__payment')}}
)

SELECT
    o.order_id
    ,o.customer_id
    ,o.order_date
    ,o.order_status
    ,LOGICAL_OR(p.payment_status = 'success') AS is_paid
    ,SUM(CASE WHEN p.payment_status = 'success' THEN p.amount ELSE 0 END) AS paid_amount
FROM orders o
LEFT JOIN payment p
ON o.order_id = p.order_id
GROUP BY ALL