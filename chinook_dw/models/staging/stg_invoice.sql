
with source_data as (

    select * FROM {{ source('chinookdb', 'Invoice') }}
)

select
	"InvoiceId" as invoice_id,
	"CustomerId" as customer_id,
	"InvoiceDate" as invoice_date,
	"BillingAddress" as billing_address,
	"BillingCity" as billing_city,
	"BillingState" as billing_state,
	"BillingCountry" as billing_country,
	"BillingPostalCode" as billing_postal_code,
	"Total" as total
from source_data