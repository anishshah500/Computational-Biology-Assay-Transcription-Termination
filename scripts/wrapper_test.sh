# run with following command:
# nohup bash wrapper_test.sh > wrapper_test.061316.out &


rawpath=/net/nevermind/data/nm/anishns/nascentdata
script=/net/nevermind/data/nm/anishns/nascentdata/test.sh
# parameters to send to script: rawpath, bedfile, time, rep
bedfile1=/net/nevermind/data/nm/anishns/nascentdata/output_length_mid_1000.chr.bed
bedfile2=/net/nevermind/data/nm/anishns/nascentdata/thousand_nucleotides_surrounding.chr.bed

for time in 5m 10m 20m TOTAL 
  do
    for rep in 1 2 3
      do
        echo "coverage for ${time}.${rep}..."
	bash $script $rawpath $bedfile1 polyA $time $rep > polyA_${time}_${rep}.out &
	#echo "done1"
	sleep 15m
	#bash $script $rawpath $bedfile2 gtf $time $rep > gtf_${time}_${rep}.out &
        #echo "done2"
	#sleep 15m
      done
  done

echo "ALL DONE!"	
