
{{
    config({
        "materialized": "view",
    })
}}

with stg_invoice as (
    select *
    FROM {{ ref('stg_invoice') }}
),
stg_invoice_line as (
    select *
    FROM {{ ref('stg_invoice_line') }}
),
dim_customer as (
    select *
    FROM {{ ref('dim_customer') }}
),
dim_track as (
    select *
    FROM {{ ref('dim_track') }}
),
dim_location as (
    select * from {{ ref('dim_location') }}
),
dim_employee as (
    select * from {{ ref('dim_employee') }}
)

select
	si.invoice_date,
	sil.invoice_id,
    sil.invoice_line_id,
	dt.track_name,
	dc.first_name as customer_first_name,
	dl.city as billing_city,
    de.first_name as employee_first_name,
	sil.quantity,
	sil.unit_price
from stg_invoice si
LEFT JOIN stg_invoice_line sil
    ON si.invoice_id = sil.invoice_id
LEFT JOIN dim_customer dc
    ON si.customer_id = dc.customer_id
LEFT JOIN dim_location dl
    ON si.billing_city = dl.city AND si.billing_country = dl.country
LEFT JOIN dim_track dt
    ON sil.track_id = dt.track_id
LEFT JOIN dim_employee de
    ON dc.employee_id = de.employee_id
order by invoice_date desc