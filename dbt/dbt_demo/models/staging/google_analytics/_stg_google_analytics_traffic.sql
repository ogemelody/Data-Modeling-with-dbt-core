with traffic as (

  select * from {{ ref('_base_google_analytics_traffic') }}

)

select * from traffic
