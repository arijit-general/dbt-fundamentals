with customers as (
    select * from {{ref('stg_customers')}}
),

orders as (
    select * from {{ref('stg_orders')}}
),

payment as (
    select * from {{ref('stg_payment')}}
),

fct_orders as (
select c.customer_id,
o.order_id,
p.amount as payment_amount
from orders o
JOIN customers c on o.customer_id = c.customer_id
JOIN payment p on o.order_id = p.orderid
)

select * from fct_orders