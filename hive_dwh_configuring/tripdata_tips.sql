use yellow_taxi;

drop view if exists tripdata_tips;
create view not exists tripdata_tips as
select  
	d_pay.name as payment_type,
	pickup_date,
	tip_amount,
	passenger_count
from tripdata
	left join tripdata_dict_payments d_pay
		on stg.payment_type = d_pay.id