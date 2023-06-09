with payments as (

  select * from {{ ref('_stg_jaffle_shop_payment') }}

), aggregated as (

  select
    order_id,
    sum(amount) as total_amount,
    sum(case payment_method when 'coupon' then amount else 0 end) as coupon_amount
  from payments
  group by 1

)

select * from aggregated