
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
    FROM {{ ref('stg_customer') }}
),
dim_location as (
    select * from {{ ref('dim_location') }}
)

select
	si.invoice_date,
	sil.invoice_id,
    sil.invoice_line_id,
	sil.track_id,
	si.customer_id,
    dc.support_rep_id,
	dl.location_id,
	sil.quantity,
	sil.unit_price
from stg_invoice si
LEFT JOIN stg_invoice_line sil
    ON si.invoice_id = sil.invoice_id
LEFT JOIN dim_customer dc
    ON si.customer_id = dc.customer_id
LEFT JOIN dim_location dl
    ON si.billing_city = dl.city AND si.billing_country = dl.country
order by invoice_date desc