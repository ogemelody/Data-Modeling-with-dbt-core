with orders as (

  select * from {{ ref('_stg_jaffle_shop_orders') }}

), payments as (

  select * from {{ ref('_stg_jaffle_shop_orders_value') }}

), final as (

  select 
    orders.orders_id,
    orders.order_date,
    orders.customer_id,
    orders.status,
    payments.total_amount,
    payments.coupon_amount
  from orders
  left join payments on orders.orders_id = payments.order_id

)

select * from final
