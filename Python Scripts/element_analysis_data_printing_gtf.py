#importing stuff
from collections import defaultdict
from numpy import *
from scipy import *

#input and output files
inp = open('/net/nevermind/data/nm/anishns/nascentdata/extracted_sequences_for_element_search_gtf.fa.out','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/upstream_data_element_plotting_gtf.txt','w')

count = defaultdict(dict)

count['AATAAA'] = []
count['ATTAAA'] = []
count['TATAAA'] = []
count['AGTAAA'] = []
count['AAAAAA'] = []
count['TAAAAA'] = []
count['AAGAAA'] = []
count['AATATA'] = []
count['CATAAA'] = []
count['AATACA'] = []
count['GATAAA'] = []
count['AATGAA'] = []
count['ACTAAA'] = []

for i in range(length/2):
	start = int(inp[2*i].strip().split("-")[0].split(":")[1])
	seq = inp[2*i + 1].strip()
	seq = seq.upper()

	strand = inp[2*i].split("(")[1].split(")")[0]

	r1 = seq.find('AATAAA')
	r2 = seq.find('ATTAAA')

	r3 = seq.find('TATAAA')
	r4 = seq.find('AGTAAA')
	r5 = seq.find('AAAAAA')
	r6 = seq.find('TAAAAA')
	r7 = seq.find('AAGAAA')
	r8 = seq.find('AATATA')
	r9 = seq.find('CATAAA')
	r10 = seq.find('AATACA')
	r11 = seq.find('GATAAA')
	r12 = seq.find('AATGAA')
	r13 = seq.find('ACTAAA')

	if(r1 != -1):
		count['AATAAA'].append(r1)

	if(r2 != -1):
		count['ATTAAA'].append(r2)

	if(r1 != -1 or r2 != -1):
		continue

	if(r3 != -1):
		count['TATAAA'].append(r3)

	if(r4 != -1):
		count['AGTAAA'].append(r4)

	if(r5 != -1):
		count['AAAAAA'].append(r5)
		
	if(r6 != -1):
		count['TAAAAA'].append(r6)

	if(r7 != -1):
		count['AAGAAA'].append(r7)

	if(r8 != -1):
		count['AATATA'].append(r8)

	if(r9 != -1):
		count['CATAAA'].append(r9)

	if(r10 != -1):
		count['AATACA'].append(r10)

	if(r11 != -1):
		count['GATAAA'].append(r11)

	if(r12 != -1):
		count['AATGAA'].append(r12)

	if(r13 != -1):
		count['ACTAAA'].append(r13)

for k in count.keys():
	print(k + ":" + str(len(count[k])))
	for i in range(len(count[k])):
		out.write(str(k) +"\t"+ str(count[k][i]) + "\n")

out.close()