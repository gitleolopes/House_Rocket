SELECT
    order_id
    ,sum(amount) as total_amount
FROM {{ ref('stg_stripe__payment') }}
WHERE payment_status = 'success'
GROUP BY 1
HAVING SUM(amount) < 0