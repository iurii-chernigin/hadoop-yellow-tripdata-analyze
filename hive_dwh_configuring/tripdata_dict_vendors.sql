use yellow_taxi;

create table is not exists tripdata_dict_vendors (
    id tinyint,
    name string
)
comment 'Dictionary for vendors information entiching'
stored as parquet;

truncate table tripdata_dict_vendors;

insert into tripdata_dict_vendors (id, name)
select 1, 'Creative Mobile Technologies, LLC'
union all
select 2, 'VeriFone Inc.';