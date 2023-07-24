with stg_employee as (
	SELECT * FROM {{ ref('stg_employee') }}
),

dim_employee as (
	select
		employee_id,
		last_name,
		first_name,
		title,
		birth_date,
		hire_date,
		city,
		state,
		country
	from stg_employee
)
select *
from dim_employee