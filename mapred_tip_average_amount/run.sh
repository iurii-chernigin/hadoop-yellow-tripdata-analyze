export MR_OUTPUT=/user/root/yellow_tripdata/output/average_tips

hadoop fs -rm -r $MR_OUTPUT

hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
-Dmapreduce.job.name='Yellow Trip Data - Average Tips by Payment Type and Month' \
-Dmapreduce.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
-Dmapreduce.map.output.key.field.separator=';' \
-Dmapreduce.partition.keypartitioner.options=-k1,2 \
-Dmapred.text.key.comparator.options=-k2,r \
-file /tmp/mapred_tips_analyze/mapper.py \
-mapper /tmp/mapred_tips_analyze/mapper.py \
-file /tmp/mapred_tips_analyze/reducer.py \
-reducer /tmp/mapred_tips_analyze/reducer.py  \
-input /user/root/yellow_tripdata/input/2019 \
-output $MR_OUTPUT \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner