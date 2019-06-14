# Script calculant les angles au cours du temps pour certaines particules, script pas réellement utilisé

import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from matplotlib import gridspec


densityB2_C6A_C3A = []
densityMBBot = []
densityMBTop = []
densityPGL = []
densityTetePol = []
densityCenter = []
densityChain1 = []
densityChain2 = []
axesy=[]

Color = ["grey","pink","orange","red"]


a=0
while (a <=200) :														# Initialisation de axesy (-25 et 25 etant les bornes arbitraires, on ne prendra aucune valeur en dehors de ces bornes)
	axesy.append(a)
	a += 1


########################################################################
# Code répété X fois en fonction du nombre de zones a afficher.
# Position du sucre
# Chargement des données, suppréssion premiere et derniere frame
figure = plt.figure(figsize = (10, 10))
gs = gridspec.GridSpec(1, 2, width_ratios=[3, 1]) 
ax = plt.subplot(gs[0])
bx = plt.subplot(gs[1])
filename = "B2_C6A_C3A3411.dat"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	if data[x] == '0':
		data[x]=data[x-1]	
del data[0]	
del data[len(data)-1]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityB2_C6A_C3A.append(float(data[x]))		

smooth=[]
for x in range (10,len(densityB2_C6A_C3A)-10):
	smooth.append((densityB2_C6A_C3A[x-10]+densityB2_C6A_C3A[x-9]+densityB2_C6A_C3A[x-8]+densityB2_C6A_C3A[x-7]+densityB2_C6A_C3A[x-6]+densityB2_C6A_C3A[x-5]+densityB2_C6A_C3A[x-4]+densityB2_C6A_C3A[x-3]+densityB2_C6A_C3A[x-2]+densityB2_C6A_C3A[x-1]+densityB2_C6A_C3A[x]+densityB2_C6A_C3A[x+1]+densityB2_C6A_C3A[x+2]+densityB2_C6A_C3A[x+3]+densityB2_C6A_C3A[x+4]+densityB2_C6A_C3A[x+5]+densityB2_C6A_C3A[x+6]+densityB2_C6A_C3A[x+7]+densityB2_C6A_C3A[x+8]+densityB2_C6A_C3A[x+9]+densityB2_C6A_C3A[x+10])/21)
ax.plot(smooth,color='red',linewidth=1.5)						# Plot du positionnement du centre de masse au cours du temps



# Calcul de la fréquence avec un pas de 1, puis normalisation pour avoir une valeur max a 1.
ColorCount = -1
for pas in range (0,len(smooth),int(len(smooth)//4)):
	Frequence = [0]*len(axesy)												# Initialisation liste vide de la meme longueur que axesy 
	compteur=-1
	ColorCount +=1
	for y in axesy:
		compteur+=1
		for x in range (pas,(pas+int(len(smooth)//4))):
			if (smooth[x] < y and smooth[x] > (y-1)):
				Frequence[compteur]+=1
	#~ maxi=max(Frequence)
	#~ for x in range (0,len(Frequence)):
		#~ Frequence[x]=Frequence[x]/maxi
	
	# Tracé de la courbe moyenne suivant une fonction quadratique afin d'avoir une allure "arondie"
	Frequence=np.array(Frequence)
	axesy=np.array(axesy)
	x_new = np.linspace(axesy.min(), axesy.max(),1000)
	f = interp1d(axesy, Frequence, kind='quadratic')
	y_smooth=f(x_new)
	bx.plot(y_smooth, x_new, color=Color[ColorCount],linewidth=1.5)

########################################################################
# Affichage, gestion de la figure

plt.tight_layout()
#~ bx.axis([0,1.1 ,0, 200])
ax.axis([0,len(smooth),0, 200])
bx.set_xlabel('Normalized density')
ax.set_xlabel('Time (µs)')
ax.set_ylabel('Angle (°)')
bx.set_yticklabels([])
bx.set_xticklabels(["","","","","",""])
ax.set_xticklabels([0,"" ,1,"" ,2,"" ,3])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='off', labelleft='off')

plt.show()














########################################################################
figure = plt.figure(figsize = (10, 10))
gs = gridspec.GridSpec(1, 2, width_ratios=[3, 1]) 
ax = plt.subplot(gs[0])
bx = plt.subplot(gs[1])
filename = "C6A_C3A_GB13411.dat"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	if data[x] == '0':
		data[x]=data[x-1]	
del data[0]	
del data[len(data)-1]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityB2_C6A_C3A.append(float(data[x]))		

smooth=[]
for x in range (10,len(densityB2_C6A_C3A)-10):
	smooth.append((densityB2_C6A_C3A[x-10]+densityB2_C6A_C3A[x-9]+densityB2_C6A_C3A[x-8]+densityB2_C6A_C3A[x-7]+densityB2_C6A_C3A[x-6]+densityB2_C6A_C3A[x-5]+densityB2_C6A_C3A[x-4]+densityB2_C6A_C3A[x-3]+densityB2_C6A_C3A[x-2]+densityB2_C6A_C3A[x-1]+densityB2_C6A_C3A[x]+densityB2_C6A_C3A[x+1]+densityB2_C6A_C3A[x+2]+densityB2_C6A_C3A[x+3]+densityB2_C6A_C3A[x+4]+densityB2_C6A_C3A[x+5]+densityB2_C6A_C3A[x+6]+densityB2_C6A_C3A[x+7]+densityB2_C6A_C3A[x+8]+densityB2_C6A_C3A[x+9]+densityB2_C6A_C3A[x+10])/21)
ax.plot(smooth,color='red',linewidth=1.5)						# Plot du positionnement du centre de masse au cours du temps



# Calcul de la fréquence avec un pas de 1, puis normalisation pour avoir une valeur max a 1.
ColorCount = -1
for pas in range (0,len(smooth),int(len(smooth)//4)):
	Frequence = [0]*len(axesy)												# Initialisation liste vide de la meme longueur que axesy 
	compteur=-1
	ColorCount +=1
	for y in axesy:
		compteur+=1
		for x in range (pas,(pas+int(len(smooth)//4))):
			if (smooth[x] < y and smooth[x] > (y-1)):
				Frequence[compteur]+=1
	#~ maxi=max(Frequence)
	#~ for x in range (0,len(Frequence)):
		#~ Frequence[x]=Frequence[x]/maxi
	
	# Tracé de la courbe moyenne suivant une fonction quadratique afin d'avoir une allure "arondie"
	Frequence=np.array(Frequence)
	axesy=np.array(axesy)
	x_new = np.linspace(axesy.min(), axesy.max(),1000)
	f = interp1d(axesy, Frequence, kind='quadratic')
	y_smooth=f(x_new)
	bx.plot(y_smooth, x_new, color=Color[ColorCount],linewidth=1.5)

########################################################################
# Affichage, gestion de la figure

plt.tight_layout()
#~ bx.axis([0,1.1 ,0, 200])
ax.axis([0,len(smooth),0, 200])
bx.set_xlabel('Normalized density')
ax.set_xlabel('Time (µs)')
ax.set_ylabel('Angle (°)')
bx.set_yticklabels([])
bx.set_xticklabels(["","","","","",""])
ax.set_xticklabels([0,"" ,1,"" ,2,"" ,3])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='off', labelleft='off')

plt.show()


















########################################################################
figure = plt.figure(figsize = (10, 10))
gs = gridspec.GridSpec(1, 2, width_ratios=[3, 1]) 
ax = plt.subplot(gs[0])
bx = plt.subplot(gs[1])
filename = "GB1_C3A_C3B3411.dat"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	if data[x] == '0':
		data[x]=data[x-1]	
del data[0]	
del data[len(data)-1]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityB2_C6A_C3A.append(float(data[x]))		

smooth=[]
for x in range (10,len(densityB2_C6A_C3A)-10):
	smooth.append((densityB2_C6A_C3A[x-10]+densityB2_C6A_C3A[x-9]+densityB2_C6A_C3A[x-8]+densityB2_C6A_C3A[x-7]+densityB2_C6A_C3A[x-6]+densityB2_C6A_C3A[x-5]+densityB2_C6A_C3A[x-4]+densityB2_C6A_C3A[x-3]+densityB2_C6A_C3A[x-2]+densityB2_C6A_C3A[x-1]+densityB2_C6A_C3A[x]+densityB2_C6A_C3A[x+1]+densityB2_C6A_C3A[x+2]+densityB2_C6A_C3A[x+3]+densityB2_C6A_C3A[x+4]+densityB2_C6A_C3A[x+5]+densityB2_C6A_C3A[x+6]+densityB2_C6A_C3A[x+7]+densityB2_C6A_C3A[x+8]+densityB2_C6A_C3A[x+9]+densityB2_C6A_C3A[x+10])/21)
ax.plot(smooth,color='red',linewidth=1.5)						# Plot du positionnement du centre de masse au cours du temps



# Calcul de la fréquence avec un pas de 1, puis normalisation pour avoir une valeur max a 1.
ColorCount = -1
for pas in range (0,len(smooth),int(len(smooth)//4)):
	Frequence = [0]*len(axesy)												# Initialisation liste vide de la meme longueur que axesy 
	compteur=-1
	ColorCount +=1
	for y in axesy:
		compteur+=1
		for x in range (pas,(pas+int(len(smooth)//4))):
			if (smooth[x] < y and smooth[x] > (y-1)):
				Frequence[compteur]+=1
	#~ maxi=max(Frequence)
	#~ for x in range (0,len(Frequence)):
		#~ Frequence[x]=Frequence[x]/maxi
	
	# Tracé de la courbe moyenne suivant une fonction quadratique afin d'avoir une allure "arondie"
	Frequence=np.array(Frequence)
	axesy=np.array(axesy)
	x_new = np.linspace(axesy.min(), axesy.max(),1000)
	f = interp1d(axesy, Frequence, kind='quadratic')
	y_smooth=f(x_new)
	bx.plot(y_smooth, x_new, color=Color[ColorCount],linewidth=1.5)

########################################################################
# Affichage, gestion de la figure

plt.tight_layout()
#~ bx.axis([0,1.1 ,0, 200])
ax.axis([0,len(smooth),0, 200])
bx.set_xlabel('Normalized density')
ax.set_xlabel('Time (µs)')
ax.set_ylabel('Angle (°)')
bx.set_yticklabels([])
bx.set_xticklabels(["","","","","",""])
ax.set_xticklabels([0,"" ,1,"" ,2,"" ,3])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='off', labelleft='off')

plt.show()
















########################################################################
figure = plt.figure(figsize = (10, 10))
gs = gridspec.GridSpec(1, 2, width_ratios=[3, 1]) 
ax = plt.subplot(gs[0])
bx = plt.subplot(gs[1])
filename = "GB1_C3A_C3C3411.dat"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	if data[x] == '0':
		data[x]=data[x-1]	
del data[0]	
del data[len(data)-1]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityB2_C6A_C3A.append(float(data[x]))		

smooth=[]
for x in range (10,len(densityB2_C6A_C3A)-10):
	smooth.append((densityB2_C6A_C3A[x-10]+densityB2_C6A_C3A[x-9]+densityB2_C6A_C3A[x-8]+densityB2_C6A_C3A[x-7]+densityB2_C6A_C3A[x-6]+densityB2_C6A_C3A[x-5]+densityB2_C6A_C3A[x-4]+densityB2_C6A_C3A[x-3]+densityB2_C6A_C3A[x-2]+densityB2_C6A_C3A[x-1]+densityB2_C6A_C3A[x]+densityB2_C6A_C3A[x+1]+densityB2_C6A_C3A[x+2]+densityB2_C6A_C3A[x+3]+densityB2_C6A_C3A[x+4]+densityB2_C6A_C3A[x+5]+densityB2_C6A_C3A[x+6]+densityB2_C6A_C3A[x+7]+densityB2_C6A_C3A[x+8]+densityB2_C6A_C3A[x+9]+densityB2_C6A_C3A[x+10])/21)
ax.plot(smooth,color='red',linewidth=1.5)						# Plot du positionnement du centre de masse au cours du temps



# Calcul de la fréquence avec un pas de 1, puis normalisation pour avoir une valeur max a 1.
ColorCount = -1
for pas in range (0,len(smooth),int(len(smooth)//4)):
	Frequence = [0]*len(axesy)												# Initialisation liste vide de la meme longueur que axesy 
	compteur=-1
	ColorCount +=1
	for y in axesy:
		compteur+=1
		for x in range (pas,(pas+int(len(smooth)//4))):
			if (smooth[x] < y and smooth[x] > (y-1)):
				Frequence[compteur]+=1
	#~ maxi=max(Frequence)
	#~ for x in range (0,len(Frequence)):
		#~ Frequence[x]=Frequence[x]/maxi
	
	# Tracé de la courbe moyenne suivant une fonction quadratique afin d'avoir une allure "arondie"
	Frequence=np.array(Frequence)
	axesy=np.array(axesy)
	x_new = np.linspace(axesy.min(), axesy.max(),1000)
	f = interp1d(axesy, Frequence, kind='quadratic')
	y_smooth=f(x_new)
	bx.plot(y_smooth, x_new, color=Color[ColorCount],linewidth=1.5)

########################################################################
# Affichage, gestion de la figure

plt.tight_layout()
bx.axis([0,max(Frequence),0, 200])
ax.axis([0,len(smooth),0, 200])
bx.set_xlabel('Normalized density')
ax.set_xlabel('Time (µs)')
ax.set_ylabel('Angle (°)')
bx.set_yticklabels([])
bx.set_xticklabels(["","","","","",""])
ax.set_xticklabels([0,"" ,1,"" ,2,"" ,3])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='off', labelleft='off')

plt.show()






















