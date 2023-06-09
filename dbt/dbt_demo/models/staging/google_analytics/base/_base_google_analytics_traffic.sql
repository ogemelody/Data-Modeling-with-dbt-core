with source as (

  select * from {{ source('google_analytics', 'ga_traffic') }}

)

select * from source
