WITH payment AS(
    SELECT * FROM {{ref('stg_stripe__payment')}}
)

SELECT
    payment_id
    ,created_at
    ,order_id
    ,payment_method
    ,payment_status
    ,amount
FROM payment