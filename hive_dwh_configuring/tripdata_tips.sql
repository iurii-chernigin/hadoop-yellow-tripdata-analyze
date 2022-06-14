use yellow_taxi;

drop view if exists tripdata_tips;
create view if not exists tripdata_tips as
select  
	d_pay.name as payment_type,
	pickup_date,
	tip_amount,
	passenger_count
from tripdata td
	left join tripdata_dict_payments d_pay
		on td.payment_type = d_pay.id;