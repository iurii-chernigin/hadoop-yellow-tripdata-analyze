export MR_OUTPUT=/user/root/yellow_tripdata/output/average_tips

hadoop fs -rm -r $MR_OUTPUT

hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
-Dmapred.job.name='Yellow Trip Data - Average Tips by Payment Type' \
-file /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-mapper /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-file /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-reducer /tmp/hadoop-yellow-tipdata-analyze/average_tips_by_payment_type/mapper.py \
-input /user/root/yellow_tripdata/input/2020 \
-output $MR_OUTPUT