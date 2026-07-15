WITH customers AS(
    SELECT * FROM {{ref('int_customers')}}
)

,benchmarks AS(
    SELECT
    AVG(total_revenue) AS avg_revenue
    ,AVG(total_orders) AS avg_orders
    FROM customers
    WHERE has_orders = true
)

SELECT
    c.*,

    CASE
        WHEN c.has_orders = false THEN 'no_orders'

        WHEN c.total_revenue >= b.avg_revenue
         AND c.total_orders  >= b.avg_orders
            THEN 'vip'

        WHEN c.total_revenue >= b.avg_revenue
         AND c.total_orders  <  b.avg_orders
            THEN 'high_ticket_low_frequency'

        WHEN c.total_revenue <  b.avg_revenue
         AND c.total_orders  >= b.avg_orders
            THEN 'low_ticket_high_frequency'

        ELSE 'low_value'
    END AS customer_segment

FROM customers c
CROSS JOIN benchmarks b