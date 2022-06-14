use yellow_taxi;

drop table if exists tripdata_dict_storeandfwd;

create table if not exists tripdata_dict_storeandfwd (
    id string,
    name string
)
comment "Dictionary with information about offline mode that could be on the moment of the ride"
stored as parquet;

insert into tripdata_dict_storeandfwd(id, name)
select 'Y', 'Store and forward trip'
union all
select 'N', 'Not a store and forward trip';