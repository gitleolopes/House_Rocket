WITH orders AS(
    SELECT * FROM {{ref('fct_orders')}}
)

,customers AS(
    SELECT * FROM {{ref('dim_customers')}}
)

SELECT
    o.order_id
    ,o.order_date
    ,o.order_status
    ,o.is_paid
    ,o.paid_amount
    ,o.customer_id
    ,c.full_name
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id