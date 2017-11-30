import sys
from collections import defaultdict
from numpy import *
from scipy import *
import pdb
import os
import subprocess
import argparse
import collections
from os.path import isfile, join
import gzip
import getopt

arg1 = sys.argv[1]
arg2 = sys.argv[2]
threshold = int(sys.argv[3])
output = sys.argv[4]

end_output = defaultdict(dict)



if arg1[-2:] == 'gz': #coverage
	file1 = gzip.open(arg1,'r').readlines()
	#print(file1[0].strip().split())
if arg1[-2:] == 'gz': #depth
	file2 = gzip.open(arg2,'r').readlines()
	#print(file2[0].strip().split())
#print('files opened')
out = open(output,'w')

out.write('Region Name\tcoverage\t'),
for i in range(2000):
	out.write(str((i+1))+'\t'),
out.write('\n')

length = len(file1)
inner_length = len(file2)

for i in range(length):
	inp1 = file1[i].strip().split()
	gene_id_file1 = inp1[3].split(';')
	gene_id_file1_coverage = inp1[6]
	gene_id_file1_coverage_int = int(gene_id_file1_coverage)

	if (gene_id_file1 not in end_output.keys()) and (gene_id_file1_coverage_int > threshold):
		end_output[gene_id_file1]['coverage'] = gene_id_file1_coverage
		print('added')
		end_output[gene_id_file1]['l'] = []
print(end_output)

pdb.set_trace()

for i in range(inner_length):
	inp2 = file2[i].strip().split()
	gene_id_file2_int = inp2[3].split(';')
	gene_id_file2 = gene_id_file2_int[0]
	last_gene_id = gene_id_file2

	# add depth information to list in dictionary 
	if gene_id_file2 in end_output.keys():
		end_output[gene_id_file2]['l'].append(inp2[6])

for i in end_output.keys():
	out.write(i+'\t'+end_output[i]['coverage']+'\t')
	out.write('\t'.join(end_output[i]['l']) +'\n')
		#end_output[gene_id_file2]['l'].append(inp2[6])
		#out.write(inp2[6] + '\t')

	#if last_gene_id != gene_id_file2:
	#	out.write('\n')

out.close()