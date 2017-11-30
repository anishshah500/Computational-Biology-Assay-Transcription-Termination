#outputs 2 files - one with the length of the middle region and one with the middle position
from numpy import *
from scipy import *

inp = open('/net/nevermind/data/nm/anishns/nascentdata/output_greater.bed','r').readlines()	
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/output_length_mid.bed','w')
out1 = open('/net/nevermind/data/nm/anishns/nascentdata/middle.bed','w')

#looping through the data
for i in range(length):
	inp1 = inp[i].strip().split()
	inp11 = int(inp1[1])
	inp12 = int(inp1[2])

	#calculating the middle position and the length
	length = inp12 - inp11
	mid = (inp11+inp12)/2
	inp1[0] = 	inp1[0][3:len(inp1[0])]
	
	#output the data in respective files
	out.write(inp1[0] +'\t'+ inp1[1] +'\t'+ inp1[2] + '\tcluster'+str(i+1)+';length = '+ str(length) + ';cord='+str(inp1[1])+':'+str(inp1[2])+'\t'+inp1[3] + '\t' + inp1[4]+'\n')
	out1.write(inp1[0] + '\t' + inp1[1] + '\t' + inp1[2] + '\t' + inp1[3]+ '\t' + inp1[4] + '\t' + 'mid = ' +str(mid) + '\n') 

out.close()