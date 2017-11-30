# input commands
rawpath=$1
bedfile=$2
time=$3
rep=$4

bamfile=${rawpath}/Adelman_4sU_${time}.rep${rep}.sorted.bam

echo "coverage for ${time}.${rep}..."
coverageBed -abam $bamfile -b $bedfile -s -split | gzip > ${rawpath}/Adelman_4sU_${time}.rep${rep}.coverage.bed
#echo "depth for ${time}.${rep}..."
#coverageBed -abam $bamfile -b $bedfile -s -split -d | gzip > ${rawpath}/Adelman_4sU_${time}.rep${rep}.depth.bed

echo "ALL DONE"
