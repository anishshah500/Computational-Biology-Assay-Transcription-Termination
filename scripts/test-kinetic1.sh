#input commands
file1=$1
file2=$2
output=$3

echo "calculating kinetics data for ${file1} and ${file2}"

intersectBed -abam $file1 -b $file2 -ubam -f 0.99 -s -split | coverageBed -abam stdin -b $file2 -s -split > $output

echo "Done!"
