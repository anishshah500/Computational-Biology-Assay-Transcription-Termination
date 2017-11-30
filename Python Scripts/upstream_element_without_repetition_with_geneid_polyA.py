from collections import defaultdict
from numpy import *
from scipy import *

#input and output files
inp = open('/net/nevermind/data/nm/anishns/nascentdata/extracted_sequences_for_element_search_polyA.fa.out','r').readlines()
inp_geneid = open('/net/nevermind/data/nm/anishns/nascentdata/consider_positions_for_sequence_search_polyA.bed','r').readlines()
length = len(inp)
out = open('/net/nevermind/data/nm/anishns/nascentdata/geneid_no_repetition_upstream_data_element_plotting_polyA.txt','w')

end_output = defaultdict(dict)
k = 75

#looping through the extracted sequences
for i in range(length/2):
	start = int(inp[2*i].strip().split("-")[0].split(":")[1])
	seq = inp[2*i + 1].strip()
	seq = seq.upper()
	lowest_element = ""
	position = 100

	gene_id = inp_geneid[i].strip().split()[3]

	#checking for majority elements
	r1 = seq.find('AATAAA')
	r2 = seq.find('ATTAAA')

	if(r1 != -1):
		if(abs(r1 - k) < position):
			lowest_element = 'AATAAA'
			position = abs(r1)


	if(r2 != -1):
		if(abs(r2 - k) < position):
			lowest_element = 'ATTAAA'
			position = abs(r2)

	#checking if majority element present adding the position to the list
	if(r1 != -1 or r2 != -1):
		end_output[gene_id]['element'] = lowest_element
		end_output[gene_id]['position'] = position
		end_output[gene_id]['type'] = "major"
		continue

	#checking for minority elements if major is not found
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

	if(r3 != -1):
		if(abs(r3-k) < position):
			lowest_element = 'TATAAA'
			position = abs(r3)

	if(r4 != -1):
		if(abs(r4-k) < position):
			lowest_element = 'AGTAAA'
			position = abs(r4)

	if(r5 != -1):
		if(abs(r5-k) < position):
			lowest_element = 'AAAAAA'
			position = abs(r5)
		
	if(r6 != -1):
		if(abs(r6-k) < position):
			lowest_element = 'TAAAAA'
			position = abs(r6)

	if(r7 != -1):
		if(abs(r7-k) < position):
			lowest_element = 'AAGAAA'
			position = abs(r7)

	if(r8 != -1):
		if(abs(r8-k) < position):
			lowest_element = 'AATATA'
			position = abs(r8)

	if(r9 != -1):
		if(abs(r9-k) < position):
			lowest_element = 'CATAAA'
			position = abs(r9)

	if(r10 != -1):
		if(abs(r10-k) < position):
			lowest_element = 'AATACA'
			position = abs(r10)

	if(r11 != -1):
		if(abs(r11-k) < position):
			lowest_element = 'GATAAA'
			position = abs(r11)

	if(r12 != -1):
		if(abs(r12-k) < position):
			lowest_element = 'AATGAA'
			position = abs(r12)

	if(r13 != -1):
		if(abs(r13-k) < position):
			lowest_element = 'ACTAAA'
			position = abs(r13)

	#adding the position of minority element
	if position < 100:
		end_output[gene_id]['element'] = lowest_element
		end_output[gene_id]['position'] = position
		end_output[gene_id]['type'] = "minor"

#printing the data
for k in end_output.keys():
	out.write(k + "\t" + str(end_output[k]['element']) + "\t" + str(end_output[k]['position']) + "\t" + end_output[k]['type'] + "\n")

out.close()