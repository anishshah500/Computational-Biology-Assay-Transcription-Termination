# run with following command:
# nohup bash wrapper-graph.sh > wrapper-graph.061316.out &

rawpath=/net/nevermind/data/nm/anishns/nascentdata
script=/net/nevermind/data/nm/anishns/nascentdata/test-graph.sh
threshold='1000'

for time in 5m 10m 20m TOTAL
  do
    for rep in 1 2 3
      do
        echo "graph data for ${time}.${rep}..."
	file1=$rawpath/Adelman_4sU_${time}.rep${rep}.polyA.coverage.bed.gz
	file2=$rawpath/Adelman_4sU_${time}.rep${rep}.polyA.depth.bed.gz
        bash $script $file1 $file2 $threshold graph_data_${time}_${rep}.polyA.txt &
        sleep 3m
	file3=$rawpath/Adelman_4sU_${time}.rep${rep}.gtf.coverage.bed.gz
        file4=$rawpath/Adelman_4sU_${time}.rep${rep}.gtf.depth.bed.gz
	bash $script $file3 $file4 $threshold graph_data_${time}_${rep}.gtf.txt &
	sleep 3m
      done
  done

echo "ALL DONE!" 
