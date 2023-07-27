select 
	de.*,
	fs.invoice_date,
	fs.quantity,
	fs.unit_price
from fact_sales fs
inner join dim_employee de 
	on fs.employee_id = de.employee_id
	
