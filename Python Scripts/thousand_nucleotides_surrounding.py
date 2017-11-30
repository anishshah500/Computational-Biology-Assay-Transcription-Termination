#outputs 1000 nucleotides around mid pos in both formats gtf and bed
from collections import defaultdict
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/exon-type.gtf','r').readlines()
length = len(inp)
out1 = open('/net/nevermind/data/nm/anishns/nascentdata/thousand_nucleotides_surrounding.gtf','w')
out2 = open('/net/nevermind/data/nm/anishns/nascentdata/thousand_nucleotides_surrounding.bed','w')

for i in range(length):
	inp1 = inp[i].strip().split()
	strand = inp1[5]
	inp1[0] = inp1[0][3:len(inp1[0])]
	if strand == '+':
		k = int(inp1[1])
		if(k - 1000 < 0):
			out1.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
			out2.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
		else:
			out1.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
			out2.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')

	else:
		k = int(inp1[2])
		if(k - 1000 < 0):
			out1.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
			out2.write(inp1[0] + '\t' + '0' + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
		else:
			out1.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
			out2.write(inp1[0] + '\t' + str(k-1000) + '\t' + str(k + 1000) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5] + '\n')
out1.close()
out2.close()