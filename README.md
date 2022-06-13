# Analyze The Taxi Trip Data with MapReduce Tasks in Hadoop
Data source is New York City Taxi and Limousine Commission (TLC) [Trip Record Data](https://registry.opendata.aws/nyc-tlc-trip-records-pds/)

## Example of The Data
VendorID                   1                       2
tpep_pickup_datetime       2020-04-01 00:41:22     2020-04-01 00:07:10
tpep_dropoff_datetime      2020-04-01 01:01:53     2020-04-01 00:18:45
passenger_count            1                       1
trip_distance              1.20                    3.68
RatecodeID                 1                       1
store_and_fwd_flag         N                       N
PULocationID               41                      140
DOLocationID               24                      226
payment_type               2                       1
fare_amount                5.5                     13
extra                      0.5                     0.5
mta_tax                    0.5                     0.5
tip_amount                 0                       3.36
tolls_amount               0                       0
improvement_surcharge      0.3                     0.3
total_amount               6.8                     20.16
congestion_surcharge       0                       2.5

## Load Data From AWS to Hadoop FS via "hadoop distcp"
```
hadoop distcp \
-Dfs.s3a.endpoint=s3.amazonaws.com \
-Dfs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.AnonymousAWSCredentialsProvider \
s3a://nyc-tlc/csv_backup/yellow_tripdata_2020-*.csv /user/root/yellow_tripdata/2020/
```

## Load Data From AWS to Yandex S3 via "hadoop distcp"
```
hadoop distcp \
-Dfs.s3a.bucket.nyc-tlc.endpoint=s3.amazonaws.com \
-Dfs.s3a.bucket.yellow-taxi-data.endpoint=https://storage.yandexcloud.net \
-Dfs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.AnonymousAWSCredentialsProvider \
s3a://nyc-tlc/csv_backup/yellow_tripdata_2020-*.csv s3a://yellow-taxi-data/raw/2020/
```
## LS Files in the S3 bucket 
```
hadoop fs \
-Dfs.s3a.endpoint=https://storage.yandexcloud.net \
-Dfs.s3a.aws.credentials.provider=org.apache.hadoop.fs.s3a.AnonymousAWSCredentialsProvider \
-ls s3a://yellow-taxi-data/raw/2020/
```