#input commands
file1=$1
file2=$2
threshold=$3
output=$4

echo "calculating graph data for ${file1} and ${file2}"
python /home/anishns/final_data_for_graphs.py $file1 $file2 $threshold $output

echo "Done"
