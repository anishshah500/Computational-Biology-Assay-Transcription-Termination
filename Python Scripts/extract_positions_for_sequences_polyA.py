#importing stuff
from collections import defaultdict
from numpy import *
from scipy import *

#input and output files
inp = open('/net/nevermind/data/nm/anishns/nascentdata/output_length_mid_1000.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/consider_positions_for_sequence_search_polyA.bed','w')

#looping through the data and considering the middle posiition and a position 100 bp downstream (mid,mid-100)
for i in range(length):
	inp1 = inp[i].strip().split()
	strand = inp1[5]
	int_start = int(inp1[1])
	if(strand == '+'):
		out.write("chr" + inp1[0] + "\t" + str(int_start + 900) + "\t" + str(int_start + 1000) + "\t" + inp1[3] + "\t" + inp1[4] + "\t" + inp1[5] + "\n")
	else:
		out.write("chr" + inp1[0] + "\t" + str(int_start + 1000) + "\t" + str(int_start + 1100) + "\t" + inp1[3] + "\t" + inp1[4] + "\t" + inp1[5] + "\n")

out.close()