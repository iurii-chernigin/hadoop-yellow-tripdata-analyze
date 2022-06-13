
use yellow_taxi;

create table if not exists tripdata (
    vendor_id               tinyint,
    tpep_pickup_datetime    timestamp,
    tpep_dropoff_datetime   timestamp,
    passenger_count         tinyint,
    trip_distance           double,
    rate_code_id            tinyint,
    store_and_fwd_flag      string,
    pu_location_id          int,
    do_location_id          int,
    payment_type            tinyint,
    fare_amount             double,
    extra                   double,
    mta_tax                 double,
    tip_amount              double,
    tolls_amount            double,
    improvement_surcharge   double,
    total_amount            double,
    congestion_surcharge    double
)
comment 'Table that contains full data about trips'
partitioned by(pickup_date string)
stored as parquet;

set hive.exec.dynamic.partition.mode=nonstrict;
truncate table tripdata;

insert into tripdata partition(pickup_date)
select  
    vendor_id, 
    tpep_pickup_datetime, 
    tpep_dropoff_datetime, 
    passenger_count, 
    trip_distance, 
    rate_code_id,
    store_and_fwd_flag,
    pu_location_id,
    do_location_id,
    payment_type,
    fare_amount,
    extra,
    mta_tax,
    tip_amount,
    tolls_amount,
    improvement_surcharge,
    total_amount,
    congestion_surcharge,
    date_format(tpep_pickup_datetime, 'YYYY-MM-dd') as pickup_date
from tripdata_stage stg
	inner join tripdata_dict_payments payments
		on stg.payment_type = payments.id
	inner join tripdata_dict_rates rates
		on stg.rate_code_id = rates.id
	inner join tripdata_dict_vendors vendors
		on stg.vendor_id = vendors.id
where 
    year(tpep_pickup_datetime) = 2020
    and tip_amount >= 0.0
    and passenger_count > 0;