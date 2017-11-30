#outputs the 90 positions around the minima
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
out = open('/net/nevermind/data/nm/anishns/nascentdata/minima_positions_90bp_surrounding.bed','w')

#looping through data
for i in range(length):
	inp1 = inp[i].strip().split()
	int_lower = int(inp1[7])
	int_upper = int(inp1[7])
	#lower boundary
	int_lower = int_lower - 45
	#upper boundary
	int_upper = int_upper + 45
	out.write(inp1[0] + "\t" + str(int_lower) + "\t" + str(int_upper) + "\t" + inp1[3] + "\t" + inp1[4] + "\t" + inp1[5] + inp1[6] + inp1[7] + "\n")

out.close()