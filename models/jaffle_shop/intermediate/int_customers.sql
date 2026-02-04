WITH customer AS(
    SELECT * FROM {{ref('stg_jaffle_shop__customers')}}
)

,orders AS(
    SELECT * FROM {{ref('int_orders')}}
)

SELECT 
    c.customer_id
    ,c.first_name
    ,c.last_name
    ,CONCAT(c.first_name, " ", c.last_name) AS full_name
    ,COUNT(o.order_id) AS total_orders
    ,MIN(o.order_date) AS first_order_date
    ,MAX(o.order_date) AS last_order_date
    ,CASE WHEN MIN(o.order_date) IS NULL THEN false ELSE true END AS has_orders
    ,COALESCE(SUM(o.paid_amount),0) AS total_revenue
    ,COALESCE(ROUND(SUM(o.paid_amount)/COUNT(DISTINCT CASE WHEN o.is_paid THEN o.order_id END),2),0) AS avg_order_value
FROM customer c 
LEFT JOIN orders o 
ON c.customer_id = o.customer_id
GROUP BY ALL