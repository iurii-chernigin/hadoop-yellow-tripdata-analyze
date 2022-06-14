
use yellow_taxi;

drop table if exists tripdata_stage;

create external table if not exists tripdata_stage (
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
comment 'Temporary external table for accessing source data on S3 bucket'
row format delimited
    fields terminated by ','
stored as textfile
location 's3a://yellow-taxi-data/raw/2020'
tblproperties("skip.header.line.count"="1");