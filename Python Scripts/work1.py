#outputs 1 position seperated bases from celrep file dpeending on +/- strand
from numpy import *
from scipy import *

#declaring type of data
fields = ['chromosome','start','end','stat','zero','strand']

#declaring input and output files
inp = open('/net/nevermind/data/nm/anishns/nascentdata/celrep_20_mmc5.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/output.bed','w')

#loping through the data 
for i in range(length):
	inp1 = inp[i].strip().split()
	strand = inp1[5]
	
	#output if strand is + or -
	if strand == '+':
		o1 = int(inp1[2])+1
		out.write(inp1[0] + '\t' + inp1[2] + '\t' + "%s"%(o1) + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5]+'\n')
	else:
		o1 = int(inp1[1])-1
		out.write(inp1[0] + '\t' + "%s" %(o1) + '\t' + inp1[1] + '\t' + inp1[3] + '\t' + inp1[4] + '\t' + inp1[5]+'\n')

out.close()	