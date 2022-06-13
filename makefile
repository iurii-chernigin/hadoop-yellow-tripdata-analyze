copy_mr_avg_tip_tomaster:
	scp -r ./mapred_tip_average_amount ubuntu@51.250.51.24:/tmp/

copy_mr_sum_tip_tomaster:
	scp -r ./mapred_tip_summary_amount ubuntu@51.250.51.24:/tmp/

copy_hive_dwh_configuring_tomaster:
	scp -r ./hive_dwh_configuring root@51.250.126.61:/tmp/