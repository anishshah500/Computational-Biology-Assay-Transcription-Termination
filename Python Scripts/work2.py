#takes out the data data with greater than 1 read
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/output_merged.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/output_greater.bed','w')

#loops through the data and gets out the data with more than 1 reads
for i in range(length):
	inp1 = inp[i].strip().split()
	c = int(inp1[3])
	if(c > 1):
		out.write(inp1[0]+'\t'+inp1[1]+'\t'+inp1[2]+'\t'+inp1[3]+'\t'+inp1[4]+'\n')

out.close()