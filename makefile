copy_mr_avg_tip_tomaster:
	scp -r ./mapred_tip_average_amount root@<MasterNode IP Address>:/tmp/

copy_mr_sum_tip_tomaster:
	scp -r ./mapred_tip_summary_amount root@<MasterNode IP Address>:/tmp/