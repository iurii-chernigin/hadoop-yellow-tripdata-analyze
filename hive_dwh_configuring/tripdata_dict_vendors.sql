use yellow_taxi;

drop table if exists tripdata_dict_vendors;

create table if not exists tripdata_dict_vendors (
    id tinyint,
    name string
)
comment 'Dictionary for vendors information entiching'
stored as parquet;

insert into tripdata_dict_vendors (id, name)
select 1, 'Creative Mobile Technologies, LLC'
union all
select 2, 'VeriFone Inc.';