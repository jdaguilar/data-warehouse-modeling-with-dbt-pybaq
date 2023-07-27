select 
	dc.*,
	fs.invoice_date,
	fs.quantity,
	fs.unit_price
from fact_sales fs
inner join dim_customer dc 
	on fs.customer_id = dc.customer_id  
	
