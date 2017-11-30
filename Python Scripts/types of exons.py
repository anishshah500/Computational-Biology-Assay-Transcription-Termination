from collections import defaultdict
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/dmel-allElementsCDS-r5.57.gtf','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/exon-type.gtf','w')

end_output = defaultdict(dict)
for i in range(length):
	inp1 = inp[i].strip().split()

	type = inp1[2]
	strand = inp1[6]

	if type == 'exon':
		transcript_id_intermediate = inp1[9].split(';')
		transcript_id = transcript_id_intermediate[0]
		gene_id_intermediate = inp1[11].split(';')
		gene_id = gene_id_intermediate[0]
		end = inp1[4]
		int_end = int(end)

		if gene_id not in end_output.keys():
			end_output[gene_id][transcript_id] = end
			print(gene_id + '\t' + transcript_id + '\t' + end)

		else:
			cur_end_int = int(end_output[gene_id][transcript_id])
			
			if (strand == '+' and int_end > cur_end_int):
				end_output[gene_id][transcript_id] = end
				print(gene_id + '\t' + transcript_id + '\t' + end)

			if (strand == '-' and int_end < cur_end_int):
				end_output[gene_id][transcript_id] = end
				print(gene_id + '\t' + transcript_id + '\t' + end)


		#end_output[gene_id][transcript_id] = end

		