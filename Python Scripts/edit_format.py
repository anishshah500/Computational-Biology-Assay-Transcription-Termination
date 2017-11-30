from collections import defaultdict
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/result_1.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/final_result_middle_5min.bed','w')

#total reads
k = 171714981 / float(1000000)

for i in range(length):
	inp1 = inp[i].strip().split();
	res_int = float(inp1[9])
	res_int = res_int / k
	out.write(inp1[0]+'\t'+inp1[1]+'\t'+inp1[2]+'\t'+inp1[3]+inp1[4]+inp1[5]+'\t'+inp1[6]+'\t'+inp1[7]+'\t'+inp1[8]+'\t'+str(res_int)+'\n')