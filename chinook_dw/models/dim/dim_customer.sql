with stg_customer as (
    select * FROM {{ ref('stg_customer') }}
)

select
	customer_id,
    first_name,
    last_name,
    company,
    city,
    state,
    country,
    support_rep_id as employee_id
from stg_customer
