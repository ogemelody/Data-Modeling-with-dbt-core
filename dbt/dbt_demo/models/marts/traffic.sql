with traffic as (

  select * from {{ ref('_stg_google_analytics_traffic') }}

), orders as (

  select * from {{ ref('_stg_jaffle_shop_orders') }}

), orders_daily as (

  select
    orders.order_date as order_date,
    count(*) as orders_amount
  from orders
  group by 1

), final as (

select 
    traffic.date,
    traffic.sessions,
    traffic.visitors,
    traffic.page_views,
    orders_daily.orders_amount,
    round((orders_daily.orders_amount::decimal / traffic.visitors * 100 ), 2) as conversion_rate
  from traffic
  left join orders_daily on traffic.date = orders_daily.order_date

)

select * from final