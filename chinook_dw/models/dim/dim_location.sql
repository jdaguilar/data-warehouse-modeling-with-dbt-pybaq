
with stg_invoice as (
    select * FROM {{ ref('stg_invoice') }}
)

select distinct
    {{ dbt_utils.generate_surrogate_key(['billing_city', 'billing_country']) }} AS location_id,
	billing_city as city,
	billing_state as state,
	billing_country as country
from stg_invoice

