export MR_OUTPUT=/user/root/yellow_tripdata/output/average_tips

hadoop fs -rm -r $MR_OUTPUT

hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
-Dmapred.job.name='Yellow Trip Data - Average Tips by Payment Type' \
-Dstream.map.output.field.seprator=;
-Dstream.num.map.output.key.fields=3 \
-Dmapred.key.partitioner.options=-k1,2 \
-Dmap.output.field.seprator=; \
\
-file /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-mapper /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-file /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-reducer /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-input /user/root/yellow_tripdata/input/2020 \
-output $MR_OUTPUT