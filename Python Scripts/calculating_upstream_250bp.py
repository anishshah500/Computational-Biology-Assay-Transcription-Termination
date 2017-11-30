#calculating the upstream positions depending on the strand
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

inp = open('/net/nevermind/data/nm/anishns/nascentdata/middle.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/upstream_positions_250bp_surrounding.bed','w')

for i in range(length):
	inp1 = inp[i].strip().split()
	int_lower = int(inp1[7])
	int_upper = int(inp1[7])

	strand = inp1[4]

	#calculating the upper and the lower positions of the upstream nucleotides based on the direction of the strand
	if strand == '+':
		int_lower = int_lower - 340
		int_upper = int_upper - 250

	else:
		int_upper = int_upper + 340
		int_lower = int_lower + 250

	out.write(inp1[0] + "\t" + str(int_lower) + "\t" + str(int_upper) + "\t" + inp1[3] + "\t" + inp1[4] + "\t" + inp1[5] + inp1[6] + inp1[7] + "\n")

out.close()