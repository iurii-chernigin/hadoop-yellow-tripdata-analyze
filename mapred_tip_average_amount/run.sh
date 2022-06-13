export MR_OUTPUT=/user/ubuntu/yellow_tripdata/output/average_tip

hadoop fs -rm -r $MR_OUTPUT

hadoop jar $HADOOP_MAPRED_HOME/hadoop-streaming.jar \
-Dmapreduce.job.name='Yellow Trip Data - Average Tips by Payment Type and Month' \
-Dmapreduce.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
-Dmapreduce.map.output.key.field.separator=';' \
-Dmapreduce.partition.keypartitioner.options=-k1,2 \
-Dmapred.text.key.comparator.options=-k1,2 \
-Dmapred.reduce.tasks=1 \
-Dmapreduce.input.lineinputformat.linespermap=18 \
-inputformat org.apache.hadoop.mapred.lib.NLineInputFormat \
-file /tmp/mapred_tip_average_amount/mapper.py \
-mapper /tmp/mapred_tip_average_amount/mapper.py \
-file /tmp/mapred_tip_average_amount/reducer.py \
-reducer /tmp/mapred_tip_average_amount/reducer.py  \
-input /user/ubuntu/yellow_tripdata/input/2020 \
-output $MR_OUTPUT \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner