#nohup bash wrapper-kinetic.sh > wrapper-kinetic.062216.out &

rawpath=/net/nevermind/data/nm/anishns/nascentdata
script1=/net/nevermind/data/nm/anishns/nascentdata/scripts/test-kinetic1.sh
script2=/net/nevermind/data/nm/anishns/nascentdata/scripts/test-kinetic2.sh

for time in 5m 10m 20m TOTAL
  do
    for rep in 1 2 3
      do
        echo "kinetic data for polyA ${time}.${rep}..."
        file1=$rawpath/Adelman4sU_${time}.rep${rep}.sorted.bam
        file2=$rawpath/minima_90_surrounding_positions_polyA.chr.bed
        bash $script1 $file1 $file2 $rawpath/kinetics_coverage_minima_data_${time}_${rep}.polyA.bed &
        sleep 1m
        file3=$rawpath/Adelman4sU_${time}.rep${rep}.sorted.bam
        file4=$rawpath/upstream_250_surrounding_positions_polyA.chr.bed
        bash $script2 $file3 $file4 $rawpath/kinetics_coverage_upstream_data_${time}_${rep}.polyA.bed &
        sleep 1m
	echo "kinetic data for gtf ${time}.${rep}..."
        file1=$rawpath/Adelman4sU_${time}.rep${rep}.sorted.bam
        file2=$rawpath/minima_90_surrounding_positions_gtf_modified.chr.bed
        bash $script1 $file1 $file2 $rawpath/kinetics_coverage_minima_data_${time}_${rep}.gtf.bed &
        sleep 1m
        file3=$rawpath/Adelman4sU_${time}.rep${rep}.sorted.bam
        file4=$rawpath/upstream_250_surrounding_positions_gtf_modified.chr.bed
        bash $script2 $file3 $file4 $rawpath/kinetics_coverage_upstream_data_${time}_${rep}.gtf.bed &
        sleep 1m
      done
  done

echo "ALL DONE!"
