
with sc_customer AS (
    select * FROM {{ source('chinookdb', 'Customer') }}
)

select
    "CustomerId" AS customer_id,
    "FirstName" AS first_name,
    "LastName" AS last_name,
    "Company" AS company,
    "Address" AS address,
    "City" AS city,
    "State" AS state,
    "Country" AS country,
    "PostalCode" AS postal_code,
    "Phone" AS phone,
    "Fax" AS fax,
    "Email" AS email,
    "SupportRepId" AS support_rep_id
from sc_customer