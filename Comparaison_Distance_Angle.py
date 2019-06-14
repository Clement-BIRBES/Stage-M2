# Script Matthieu
from numpy  import *
import numpy as np
import matplotlib
import matplotlib.pyplot as p
import matplotlib.cm as cm
import sys
import operator
from scipy.stats import norm
import numpy
from pylab import plot, show, savefig, xlim, figure, \
                hold, ylim, legend, boxplot, setp, axes



def setBoxColors(bp):
	setp(bp['boxes'][0].set( color='red',alpha=0.5, linewidth=2))
	setp(bp['boxes'][1].set( color='blue',alpha=0.5, linewidth=2))

	## change color and linewidth of the whiskers
	setp(bp['whiskers'][0].set(color='red', linewidth=2))
	setp(bp['whiskers'][1].set(color='red', linewidth=2))
	setp(bp['whiskers'][2].set(color='blue', linewidth=2))
	setp(bp['whiskers'][3].set(color='blue', linewidth=2))

	## change color and linewidth of the caps
	setp(bp['caps'][0].set(color='red', linewidth=2))
	setp(bp['caps'][1].set(color='red', linewidth=2))
	setp(bp['caps'][2].set(color='blue', linewidth=2))
	setp(bp['caps'][3].set(color='blue', linewidth=2))

	## change color and linewidth of the medians
	setp(bp['medians'][0].set(color='red', linewidth=2))
	setp(bp['medians'][1].set(color='blue', linewidth=2))


# PGL distance leg1
#list_files_AT =["GB1_C1A_AT_dist.dat","C1A_C2A_AT_dist.dat","C2A_C3A_AT_dist.dat","C3A_C4A_AT_dist.dat","C4A_C5A_AT_dist.dat","C5A_C6A_AT_dist.dat","C6A_C7A_AT_dist.dat"]
#list_files_CG = ["GB1_C1A_CG_dist.dat","C1A_C2A_CG_dist.dat","C2A_C3A_CG_dist.dat","C3A_C4A_CG_dist.dat","C4A_C5A_CG_dist.dat","C5A_C6A_CG_dist.dat","C6A_C7A_CG_dist.dat"]

# PGL distance SugarPhenyl
#list_files_AT = ["SC41_C7A_AT_dist.dat","SC41_SC42_AT_dist.dat","SC41_SC43_AT_dist.dat","SC42_SC43_AT_dist.dat","SC42_B2_AT_dist.dat","B1_B2_AT_dist.dat","B3_B2_AT_dist.dat"]
#list_files_CG = ["SC41_C7A_CG_dist.dat","SC41_SC42_CG_dist.dat","SC41_SC43_CG_dist.dat","SC42_SC43_CG_dist.dat","SC42_B2_CG_dist.dat","B1_B2_CG_dist.dat","B3_B2_CG_dist.dat"]

# PGL distance leg2
#list_files_AT = ["C3A_GL1_AT_dist.dat","GL1_C1B_AT_dist.dat","C1B_C2B_AT_dist.dat","C2B_C3B_AT_dist.dat","C3B_C4B_AT_dist.dat","C4B_C5B_AT_dist.dat","C5B_C6B_AT_dist.dat","C6B_C7B_AT_dist.dat"]
#list_files_CG = ["C3A_GL1_CG_dist.dat","GL1_C1B_CG_dist.dat","C1B_C2B_CG_dist.dat","C2B_C3B_CG_dist.dat","C3B_C4B_CG_dist.dat","C4B_C5B_CG_dist.dat","C5B_C6B_CG_dist.dat","C6B_C7B_CG_dist.dat"]

# PGL distance leg3
#list_files_AT = ["C3A_GL2_AT_dist.dat","GL2_C1C_AT_dist.dat","C1C_C2C_AT_dist.dat","C2C_C3C_AT_dist.dat","C3C_C4C_AT_dist.dat","C4C_C5C_AT_dist.dat","C5C_C6C_AT_dist.dat","C6C_C7C_AT_dist.dat"]
#list_files_CG = ["C3A_GL2_CG_dist.dat","GL2_C1C_CG_dist.dat","C1C_C2C_CG_dist.dat","C2C_C3C_CG_dist.dat","C3C_C4C_CG_dist.dat","C4C_C5C_CG_dist.dat","C5C_C6C_CG_dist.dat","C6C_C7C_CG_dist.dat"]


# PGL angle leg1
list_files_AT = ["angle_GB1_C1A_C2A_AT.dat","angle_C1A_C2A_C3A_AT.dat","angle_C2A_C3A_C4A_AT.dat","angle_C3A_C4A_C5A_AT.dat","angle_C4A_C5A_C6A_AT.dat","angle_C5A_C6A_C7A_AT.dat"]
list_files_CG = ["angle_GB1_C1A_C2A_CG.dat","angle_C1A_C2A_C3A_CG.dat","angle_C2A_C3A_C4A_CG.dat","angle_C3A_C4A_C5A_CG.dat","angle_C4A_C5A_C6A_CG.dat","angle_C5A_C6A_C7A_CG.dat"]

# PGL angle SugarPhenyl
#list_files_AT = ["angle_C6A_C7A_SC41_AT.dat","angle_C7A_SC41_SC42_AT.dat","angle_C7A_SC41_SC43_AT.dat","angle_SC42_SC41_SC43_AT.dat","angle_SC41_SC43_SC42_AT.dat","angle_SC41_SC42_B2_AT.dat","angle_SC42_B2_B1_AT.dat","angle_SC42_B2_B3_AT.dat","angle_B3_B2_B1_AT.dat"]
#list_files_CG = ["angle_C6A_C7A_SC41_CG.dat","angle_C7A_SC41_SC42_CG.dat","angle_C7A_SC41_SC43_CG.dat","angle_SC42_SC41_SC43_CG.dat","angle_SC41_SC43_SC42_CG.dat","angle_SC41_SC42_B2_CG.dat","angle_SC42_B2_B1_CG.dat","angle_SC42_B2_B3_CG.dat","angle_B3_B2_B1_CG.dat"]

# PGL angle leg2
#list_files_AT = ["angle_C3A_GL1_C1B_AT.dat","angle_GL1_C1B_C2B_AT.dat","angle_C1B_C2B_C3B_AT.dat","angle_C2B_C3B_C4B_AT.dat","angle_C3B_C4B_C5B_AT.dat","angle_C4B_C5B_C6B_AT.dat","angle_C5B_C6B_C7B_AT.dat"]
#list_files_CG = ["angle_C3A_GL1_C1B_CG.dat","angle_GL1_C1B_C2B_CG.dat","angle_C1B_C2B_C3B_CG.dat","angle_C2B_C3B_C4B_CG.dat","angle_C3B_C4B_C5B_CG.dat","angle_C4B_C5B_C6B_CG.dat","angle_C5B_C6B_C7B_CG.dat"]


# PGL angle leg3
#list_files_AT = ["angle_C3A_GL2_C1C_AT.dat","angle_GL2_C1C_C2C_AT.dat","angle_C1C_C2C_C3C_AT.dat","angle_C2C_C3C_C4C_AT.dat","angle_C3C_C4C_C5C_AT.dat","angle_C4C_C5C_C6C_AT.dat","angle_C5C_C6C_C7C_AT.dat"]
#list_files_CG = ["angle_C3A_GL2_C1C_CG.dat","angle_GL2_C1C_C2C_CG.dat","angle_C1C_C2C_C3C_CG.dat","angle_C2C_C3C_C4C_CG.dat","angle_C3C_C4C_C5C_CG.dat","angle_C4C_C5C_C6C_CG.dat","angle_C5C_C6C_C7C_CG.dat"]

# PGL total length
#list_files_AT = ["GB1_B2_AT_dist.dat","GL1_C7B_AT_dist.dat","GL2_C7C_AT_dist.dat"]
#list_files_CG = ["GB1_B2_CG_dist.dat","GL1_C7B_CG_dist.dat","GL2_C7C_CG_dist.dat"]

#PGL leg2 3 attachment
#list_files_AT = ["angle_C3A_GL1_C1B_AT.dat","angle_C2A_C3A_GL1_AT.dat","angle_C4A_C3A_GL1_AT.dat","angle_C3A_GL2_C1C_AT.dat","angle_C2A_C3A_GL2_AT.dat","angle_C4A_C3A_GL2_AT.dat","angle_GL1_C3A_GL2_AT.dat"]
#list_files_CG = ["angle_C3A_GL1_C1B_CG.dat","angle_C2A_C3A_GL1_CG.dat","angle_C4A_C3A_GL1_CG.dat","angle_C3A_GL2_C1C_CG.dat","angle_C2A_C3A_GL2_CG.dat","angle_C4A_C3A_GL2_CG.dat","angle_GL1_C3A_GL2_CG.dat"]



liste_y1_global = []
liste_y2_global = []

time_contact = 0
liste_y =[]	



for filename1,filename2 in zip(list_files_AT,list_files_CG):

	liste_y1 =[]	
	liste_y2 =[]

	fichier1 = open(filename1, "r")
	fichier2 = open(filename2, "r")

	for line in fichier1.readlines():

		listeValeur = line.split()
		listeValeurF = [float(x) for x in listeValeur]
		liste_y1.append(listeValeurF[0:])
		

	for line in fichier2.readlines():

		listeValeur = line.split()
		listeValeurF = [float(x) for x in listeValeur]
		liste_y2.append(listeValeurF[0:])
		

	liste_y1 = numpy.asarray(liste_y1)
	final_list1 =(liste_y1.flatten()).tolist()
	liste_y1_global.append(liste_y1)	

	liste_y2 = numpy.asarray(liste_y2)
	final_list2 =(liste_y2.flatten()).tolist()
	liste_y2_global.append(liste_y2)

#liste_y = [item for sublist in liste_y for item in sublist]
#final_list = filter(lambda a: a != 0, liste_y)
#final_list = reduce(operator.add, list_density) 

figure = p.figure()
ax = figure.add_subplot(111)
hold(True)

maxx = len(liste_y1_global)*3


list_labels = []

for name in list_files_AT:
	# labels bond
	#list_labels.append(name[0:7])
	# labels angles	
	list_labels.append(name[6:17])

list_xticks = []
for i in range(0,len(liste_y1_global)):
	tick = 1.5 + 3*i
	list_xticks.append(tick)


print(list_xticks)
print(list_labels)

for i in range(0,len(liste_y1_global)):
	final_pair = [liste_y1_global[i],liste_y2_global[i]]
	print(list_labels[i])

	max_dist = 6 
	max_list1 = int(max(final_list1))
	max_list2 = int(max(final_list2))
	#p.xticks(range(0,max_list,1))
	#ax.set_xlim([0,max_list])

	if (max_list1 > 10 or max_list2 > 10):
		max_dist = 30
	
	if (max_list1 > 30 or max_list2 > 30):
		max_dist = 180

	A = list_xticks[i]-0.5
	B = list_xticks[i]+0.5 
	bp =matplotlib.pyplot.boxplot(final_pair,positions = [A, B],patch_artist=True,  showfliers=False, widths = 0.6) 
	setBoxColors(bp)

	ax.set_xlim(0,list_xticks[-1]+1.5)
	ax.set_ylim([0,max_dist])
	ax.set_xticks(list_xticks)
	ax.set_xticklabels(list_labels)

	



figure.savefig("Resultats/angle_.svg", dpi=200)


F = open("Resultats/angles_mean_totalLength.dat","w") 

for i in range(0,len(liste_y1_global)):
	param = norm.fit(sorted(liste_y1_global[i]))
	x_list1 = numpy.arange(0,max_list1,0.01)
	pdf_fitted = norm.pdf(x_list1,loc=param[0],scale=param[1])
	mean = norm.mean(loc=param[0],scale=param[1])
	meanAT=list_labels[i]+' meanAT = '+str(mean)+"\n"
 
	F.write(meanAT)

	param = norm.fit(sorted(liste_y2_global[i]))
	x_list2 = numpy.arange(0,max_list2,0.01)
	pdf_fitted = norm.pdf(x_list2,loc=param[0],scale=param[1])
	mean = norm.mean(loc=param[0],scale=param[1]) 
	meanCG=list_labels[i]+' meanCG = '+str(mean)+"\n"
	F.write(meanCG)
	F.write("\n")

F.close() 
