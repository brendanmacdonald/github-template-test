
with stg_main as (
  select *
  from {{ source('sales', 'orders') }}
  group by all
),

main as (
  select *,
    {{ bu_sk()}}::string as new_column
  from stg_main
  where customer_tier = 'premium'
)

select *
from main