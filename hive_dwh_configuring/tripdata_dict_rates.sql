use yellow_taxi;

drop table if exists tripdata_dict_rates;

create table if not exists tripdata_dict_rates (
    id tinyint,
    name string
)
comment 'Dictionary for rate codes enriching'
stored as parquet;

insert into tripdata_dict_rates (id, name)
select 1, 'Standard rate'
union all
select 2, 'JFK'
union all
select 3, 'Newark'
union all
select 4, 'Nassau or Westchester'
union all
select 5, 'Negotiated fare'
union all
select 6, 'Group ride';