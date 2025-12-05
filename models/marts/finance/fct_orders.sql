with orders AS (
    select * from {{ref('stg_jaffle_shop__orders')}}
)

,payments AS(
    select
    order_id
    ,SUM(amount) AS amount
    from {{ref('stg_stripe__payments')}}
    WHERE status = "success"
    GROUP BY ALL
)

select
    orders.order_id
    ,customer_id
    ,amount
    from orders
    left join payments 
    on orders.order_id = payments.order_id