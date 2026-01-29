WITH customers AS (
    SELECT * FROM {{ref('int_customers')}}
)

SELECT
    customer_id
    ,first_name
    ,last_name
    ,full_name
    ,first_order_date
    ,last_order_date
    ,total_orders
FROM customers