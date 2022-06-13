use yellow_taxi;

create table if not exists d_payments (
    id tinyint comment,
    name string comment
)
comment 'Dictionary for for payment information enriching'
stored as parquet;

truncate table is exists d_payments;

insert into d_payments (id, name)
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
select 6, 'Voided trip'