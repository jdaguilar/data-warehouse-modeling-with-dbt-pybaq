select 
	dt.*,
	fs.invoice_date,
	fs.quantity,
	fs.unit_price
from fact_sales fs
inner join dim_track dt 
	on fs.track_id = dt.track_id 
	
