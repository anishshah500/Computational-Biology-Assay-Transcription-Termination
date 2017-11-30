#outputs the genes with coverage greater than a given threshold

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

from operator import itemgetter

#input
arg1 = sys.argv[1]
arg2 = sys.argv[2]
threshold = int(sys.argv[3])
output = sys.argv[4]

#defining dictionary
end_output = defaultdict(dict)

#unzipping files
file1 = gzip.open(arg1,'r').readlines() #coverage
file2 = gzip.open(arg2,'r').readlines()	#depth
out = open(output,'w')

length = len(file1)
inner_length = len(file2)

#determining which genes have coverage > threshold
for i in range(length):
	inp1 = file1[i].strip().split()
	gene_id_file1 = inp1[3]
	gene_id_file1_coverage = inp1[6]
	gene_id_file1_coverage_int = int(gene_id_file1_coverage)

	if (gene_id_file1 not in end_output.keys()) and (gene_id_file1_coverage_int > threshold):
		end_output[gene_id_file1]['coverage'] = gene_id_file1_coverage
		end_output[gene_id_file1]['l'] = []

#mapping all depths from genes with coverage > given threshold
for i in range(0,inner_length,2000):
	inp2 = file2[i].strip().split()
	gene_id_file2 = inp2[3]
	if gene_id_file2 in end_output.keys():
		end_output[gene_id_file2]['l'] = map(itemgetter(7),map(str.split,map(str.strip,file2[i:i+2000])))

out.write('Region Name\tcoverage\t'),
for i in range(2000):
	out.write(str((i+1))+'\t'),
out.write('\n')

for i in end_output.keys():
	out.write(str(i)+'\t'+end_output[i]['coverage']+'\t')
	out.write('\t'.join(end_output[i]['l']) +'\n')

out.close()