from collections import defaultdict

from numpy import *
from scipy import *

fields = ['chromosome','flyBase','type','start','end','dot1','strand','dot2','name']
end_output = defaultdict(int)
list1 = []

inp = open('/net/nevermind/data/nm/anishns/nascentdata/dmel-allElementsCDS-r5.57.gtf','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/exon-type.gtf','w')

for i in range(length):
	inp1 = inp[i].strip().split()

	type = inp1[2]

	if type == 'exon':
		transcript_id_intermediate = inp1[9].split(';')
		transcript_id = transcript_id_intermediate[0]
		gene_id_intermediate = inp1[11].split(';')
		gene_id = gene_id_intermediate[0]
		end = inp1[4]

		list1 = list1 + [(gene_id,transcript_id,end)]

for i in range(length(list1)):
	end_output[list2[i][0]].append([list2[i][1],list2[i][2]])

print(end_output)