use yellow_taxi;

create table if not exists tripdata_dict_payments (
    id tinyint,
    name string
)
comment 'Dictionary for payment information enriching'
stored as parquet;

truncate table tripdata_dict_payments;

insert into tripdata_dict_payments (id, name)
select 1, 'Credit card'
union all
select 2, 'Cash'
union all
select 3, 'No charge'
union all
select 4, 'Dispute'
union all
select 5, 'Unknown'
union all
select 6, 'Voided trip';