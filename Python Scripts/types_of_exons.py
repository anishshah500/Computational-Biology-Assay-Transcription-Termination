#outputs the genes ad the types of transcripts - either single if just 1 form is present or alt_n if n altenative forms for the transcript are present
from collections import defaultdict
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/dmel-allElementsCDS-r5.57.gtf','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/exon-type.gtf','w')

#defining default dictionary of dictionaries
end_output = defaultdict(dict)


#looping through the data
for i in range(length):
	inp1 = inp[i].strip().split()

	type = inp1[2]
	strand = inp1[6]
	k = 0

	#adding all unique exons to the dictionary with each exon having a dictionary of its transcripts
	if type == 'exon':
		transcript_id_intermediate = inp1[9].split(';')
		transcript_id = transcript_id_intermediate[0]
		gene_id_intermediate = inp1[11].split(';')
		gene_id = gene_id_intermediate[0]
		end = inp1[4]
		int_end = int(end)

		#adding a new gene if gene not present or if gene is present adding the end position of the transcript to the gene dictionary
		if gene_id not in end_output.keys():
			end_output[gene_id][transcript_id] = end
			end_output[gene_id]['chr'] = inp1[0]
			end_output[gene_id]['strand'] = strand
			#print(gene_id + '\t' + transcript_id + '\t' + end)

		elif transcript_id not in end_output[gene_id].keys():
			end_output[gene_id][transcript_id] = end
			#print(gene_id + '\t' + transcript_id + '\t' + end)

		#if both the particular gene and transcript present, updating the end position of the particular gene transcript depending on the type of the strand
		else:
			cur_end_int = int(end_output[gene_id][transcript_id])
			
			if (strand == '+' and int_end > cur_end_int):
				end_output[gene_id][transcript_id] = end
				#print(gene_id + '\t' + transcript_id + '\t' + end)

			if (strand == '-' and int_end < cur_end_int):
				end_output[gene_id][transcript_id] = end
				#print(gene_id + '\t' + transcript_id + '\t' + end)

"""
for k1 in end_output.keys():
	chromosome = end_output[k1]['chr']
	cur_strand = end_output[k1]['strand']
	for k2 in end_output[k1].keys():
		if k2 == 'chr':
			continue
		elif k2 == 'strand':
			continue
		else:
			if (cur_strand == '+'):
				int_k = int(end_output[k1][k2])
				print(chromosome + '\t' + str(int_k) + '\t' + str(int_k + 1) + '\tgene_id:' + k1 + ',length:1\t.\t' + cur_strand + '\n')
			else:
				int_k = int(end_output[k1][k2])
				print(chromosome + '\t' + str(int_k - 1) + '\t' + str(int_k) + '\tgene_id:' + k1 + ',length:1\t.\t' + cur_strand + '\n')
"""

#printing out the data in the specified format with the single transcript genes normally and the alternative transcript genes as alt_0 for the last end position transcript, alt_1 for the one just less than alt_0 end and so on..
for k1 in end_output.keys():
	list1 = []
	chromosome = end_output[k1]['chr']
	cur_strand = end_output[k1]['strand']
	for k2 in end_output[k1].keys():
		if(k2 == 'strand' or k2 == 'chr'):
			continue
		else:
			list1 = list1 + [end_output[k1][k2]]
	list1.sort()
	set_l1 = set(list1)
	list_fin = []
	for i in range(len(set_l1)):
		a = set_l1.pop()
		list_fin = list_fin + [a]
	list_fin.sort()
	list_fin.reverse()
	if(len(list_fin) == 1):
		if cur_strand == '+':
			int_k = int(list_fin[0])
			out.write(chromosome + '\t' + str(int_k) + '\t' + str(int_k + 1) + '\tgene_id:' + k1 + ';single_0\t.\t' + cur_strand + '\n')
		else:
			int_k = int(list_fin[0])
			out.write(chromosome + '\t' + str(int_k - 1) + '\t' + str(int_k) + '\tgene_id:' + k1 + ';single_0\t.\t' + cur_strand + '\n')
	else:
		if cur_strand == '+':
			for i in range(len(list_fin)):
				int_k = int(list_fin[i])
				out.write(chromosome + '\t' + str(int_k) + '\t' + str(int_k + 1) + '\tgene_id:' + k1 + ';alt_'+str(i)+'\t.\t' + cur_strand + '\n')
		else:
			list_fin.reverse()
			for i in range(len(list_fin)):
				int_k = int(list_fin[i])
				out.write(chromosome + '\t' + str(int_k - 1) + '\t' + str(int_k) + '\tgene_id:' + k1 + ';alt_'+str(i)+'\t.\t' + cur_strand + '\n')


out.close()