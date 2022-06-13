use yellow_taxi;

drop table if exists tripdata_tips_average;

create table tripdata_tips_average
select
    avg(tip_amount) as avg_tip_amount,
    sum(passenger_count) as passenger_count,
    payment_type,
    pickup_date
from tripdata_tips
group by payment_type, pickup_date
order by pickup_date, payment_type desc
comment 'Average tip amount by date of the ride and a payment type'
stored as parquet;