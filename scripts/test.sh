# input commands
rawpath=$1
bedfile=$2
name=$3
time=$4
rep=$5

bamfile=${rawpath}/Adelman4sU_${time}.rep${rep}.sorted.bam

echo "coverage for ${time}.${rep}..."
coverageBed -abam $bamfile -b $bedfile -s -split | gzip > ${rawpath}/Adelman_4sU_${time}.rep${rep}.${name}.coverage.bed.gz
echo "depth for ${time}.${rep}..."
coverageBed -abam $bamfile -b $bedfile -s -split -d | gzip > ${rawpath}/Adelman_4sU_${time}.rep${rep}.${name}.depth.bed.gz

echo "ALL DONE"
