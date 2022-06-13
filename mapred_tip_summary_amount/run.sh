export MR_OUTPUT=/user/root/yellow_tripdata/output/summary_tip

hadoop fs -rm -r $MR_OUTPUT

hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
-Dmapreduce.job.name='Yellow Trip Data - Summary Tips by Payment Type and Month' \
-Dmapreduce.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
-Dmapreduce.map.output.key.field.separator=';' \
-Dmapreduce.partition.keypartitioner.options=-k1,2 \
-Dmapred.text.key.comparator.options=-k2,r \
-file /tmp/mapred_tip_summary_amount/mapper.py \
-mapper /tmp/mapred_tip_summary_amount/mapper.py \
-file /tmp/mapred_tip_summary_amount/reducer.py \
-reducer /tmp/mapred_tip_summary_amount.//reducer.py  \
-input /user/root/yellow_tripdata/input/2020 \
-output $MR_OUTPUT \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner