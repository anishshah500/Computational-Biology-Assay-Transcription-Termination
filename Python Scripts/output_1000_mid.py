#outputs 1000 bp surrounding from the middle region
from collections import defaultdict
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/output_length_mid.bed','r').readlines()
length = len(inp)
out1 = open('/net/nevermind/data/nm/anishns/nascentdata/output_length_mid_1000.bed','w')

#loops through the data
for i in range(length):
	inp1 = inp[i].strip().split()
	strand = inp1[5]
	˜inp1[0] = inp1[0][3:len(inp1[0])]
	#outputing data if strand is + and 0 if negative
	if strand == '+':
		k = int(inp1[1])
		if(k - 1000 < 0):
			out1.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + inp1[4] +inp1[5] + '\t' + inp1[6] + '\t' + inp1[7] + '\n')
			#out2.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
		else:
			out1.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + inp1[4] +inp1[5] + '\t' + inp1[6] + '\t' + inp1[7] + '\n')
			#out2.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')

	#outputing data if strand is -	and 0 if negative	
	else:
		k = int(inp1[2])
		if(k - 1000 < 0):
			out1.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + inp1[4] +inp1[5] + '\t' + inp1[6] + '\t' + inp1[7] + '\n')
			#out2.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
		else:
			out1.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + inp1[4] +inp1[5] + '\t' + inp1[6] + '\t' + inp1[7] + '\n')
			#out2.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
out1.close()