
with sc_employee as (
    select * FROM {{ source('chinookdb', 'Employee') }}
)

select
	"EmployeeId" AS employee_id,
	"LastName" AS last_name,
	"FirstName" AS first_name,
	"Title" AS title,
	"ReportsTo" AS reports_to,
	"BirthDate" AS birth_date,
	"HireDate" AS hire_date,
	"Address" AS address,
	"City" AS city,
    "State" AS state,
    "Country" AS country,
	"PostalCode" AS postal_code,
	"Phone" AS phone,
	"Fax" AS fax,
	"Email" AS email
from sc_employee