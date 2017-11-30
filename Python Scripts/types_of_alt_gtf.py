#importing stuff
from collections import defaultdict
from numpy import *
from scipy import *

#input and output files
inp = open('/net/nevermind/data/nm/anishns/nascentdata/consider_dm3_eles.gtf','r').readlines()
length = len(inp)
out1 = open('/net/nevermind/data/nm/anishns/nascentdata/types_of_alternative_exons.gtf','w')
out2 = open('/net/nevermind/data/nm/anishns/nascentdata/types_of_alternative_exons_without_positions.gtf','w')

end_output = defaultdict(dict)

#iterating over the input and adding particular gene ids and transcript ids with their start and end positions respectively
for i in range(length):
	inp1 = inp[i].strip().split()
	transcript_id_intermediate = inp1[9].split(';')
	transcript_id = transcript_id_intermediate[0]
	gene_id_intermediate = inp1[11].split(';')
	gene_id = gene_id_intermediate[0]
	strand = inp1[6]
	start = inp1[3]
	int_start = int(start)
	end = inp1[4]
	int_end = int(end)

	if gene_id not in end_output.keys():
		end_output[gene_id][transcript_id] = [start,end]
		end_output[gene_id]['chr'] = inp1[0]
		end_output[gene_id]['strand'] = strand

	elif transcript_id not in end_output[gene_id].keys():
		end_output[gene_id][transcript_id] = [start,end]

	else:
		cur_end_int = int(end_output[gene_id][transcript_id][1])
		if (strand == '+' and int_end > cur_end_int):
			end_output[gene_id][transcript_id] = [start,end]
		if (strand == '-' and int_end < cur_end_int):
			end_output[gene_id][transcript_id] = [start,end]

#determining the type of the exon by examining the start positions and end position combinations whereas single_0 if only one end position and outputing the data in the end
for k1 in end_output.keys():
	list_start = []
	list_end = []
	length_list = []
	length_list_nodup = []

	for k2 in end_output[k1].keys():
		if(k2 != 'chr' and k2 != 'strand'):
			list_start.append(end_output[k1][k2][0])
			list_end.append(end_output[k1][k2][1])
	list_start.sort()
	list_end.sort()

	for i in range(len(list_start)):
		length_list.append([list_start[i],list_end[i]])

	for elem in length_list:
		if elem not in length_list_nodup:
			length_list_nodup.append(elem)

	length_list = length_list_nodup

	if(len(list_start) == 1):
		out1.write(end_output[k1]['chr'] + "\t" + str(list_start[-1]) + "\t" + str(list_end[-1]) + "\t" + str(k1) + "\t" + end_output[k1]['strand'] + "\t" + "single_0" + "\n")
		out2.write(end_output[k1]['chr'] + "\t" + str(list_start[-1]) + "\t" + str(list_end[-1]) + "\t" + str(k1) + "\t" + end_output[k1]['strand'] + "\t" + "single_0" + "\n")
		#print(k1 + "\t" + "single_0")
		continue

	if(all(map(lambda x: x == list_start[0], list_start))):
		end_output[k1]['result'] = "Tandem UTRs"
	else:
		end_output[k1]['result'] = "Alternative Last Exons"
	
	#print(k1 + "\t" + end_output[k1]['result'])
	

	out1.write(end_output[k1]['chr'] + "\t" + str(list_start[-1]) + "\t" + str(list_end[-1]) + "\t" + str(k1)+";")
	for elem in length_list:
		out1.write(str(elem[0]) + "," + str(elem[1]) + ";")
	out1.write("\t" + end_output[k1]['strand'] + "\t" + end_output[k1]['result'] + "\n")
	out2.write(end_output[k1]['chr'] + "\t" + str(list_start[-1]) + "\t" + str(list_end[-1]) + "\t" + str(k1) + "\t" + end_output[k1]['strand'] + "\t" + end_output[k1]['result'] + "\n")

out1.close()
out2.close()