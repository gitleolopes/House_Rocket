WITH total_amount AS(
    SELECT * FROM {{ref('stg_stripe__payment')}}
    WHERE payment_status = 'success'
)

SELECT
    sum(amount) as total
    ,payment_status
    FROM total_amount
    GROUP BY payment_status