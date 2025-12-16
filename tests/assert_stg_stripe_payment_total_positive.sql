SELECT
    order_id
    ,sum(amount) as total_amount
FROM {{ ref('stg_stripe__payment') }}
GROUP BY 1
HAVING SUM(amount) < 0