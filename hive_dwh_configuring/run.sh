hive -f ./create_database.sql

hive -f ./tripdata_dict_payments.sql
hive -f ./tripdata_dict_rates.sql
hive -f ./tripdata_dict_storeandfwd.sql
hive -f ./tripdata_dict_vendors.sql

hive -f ./tripdata_stage.sql
hive -f ./tripdata.sql

hive -f ./tripdata_tips.sql
hive -f ./tripdata_tips_average.sql