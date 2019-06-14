import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from matplotlib import gridspec

axesy=[] # initialisation de l'axeY
figure = plt.figure(figsize = (10, 10)) # taille de la figure
gs = gridspec.GridSpec(1, 2, width_ratios=[3, 1]) # figure a 3 fois plus grande que figure b
ax = plt.subplot(gs[0]) 
bx = plt.subplot(gs[1])

a=-30 # borne inférieure du graphe final, avec pos axe Z allant de -30 a 30
while (a <=30) : # borne supérieure du graphe final, avec pos axe Z allant de -30 a 30
	axesy.append(a)
	a += 2.5 # pas de 2.5 pour l'analyse des fréquences 

# Position du centre de masse de la membrane, pour normalisé les positions (centré sur 0)
filename = "positionMBCenter.csv" # Ouverture du fichier contenant la position moyenne de la membrane
with open (filename) as f:
	data = f.read()
data = data.split('\n') # On split les lignes du fichier
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	# On split les lignes en fonction des espaces
del data[0]	
del data[len(data)-1]	# On supprime la premier et la derniere valeur (prise en double dans la simu)
densityCenter = [] # Création du tableau contenant les infos de positions moyennes de la MB
for x in range (0, len(data)):
	densityCenter.append(float(data[x][1])) # On remplit le tableau 
	
	
	
#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densitySucre = [] # Création tableau sucre
filename = "positionSucre.csv" # Chargement
Frequence = [0]*len(axesy) # initialisation tableau Frequence a 0 partout
compteur=-1 # initialisation compteur
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densitySucre.append(-float(data[x][1])+float(densityCenter[x])) # Etapes identiques aux precedentes, ici on recentre l'intégralité des résultats en fonctions du centre de la membrane (ici quand le PGL est placé dans le feuillet inferieur)

# Smooth des valeurs en utilisant la moyenne de 11 données
smooth3valeurs=[]
for x in range (5,len(densitySucre)-5):
	smooth3valeurs.append((densitySucre[x-5]+densitySucre[x-4]+densitySucre[x-3]+densitySucre[x-2]+densitySucre[x-1]+densitySucre[x]+densitySucre[x+1]+densitySucre[x+2]+densitySucre[x+3]+densitySucre[x+4]+densitySucre[x+5])/11)
ax.plot(densitySucre,color='red',linewidth=1.5) # plot du tableau densitySucre en rouge, epaisseur 1.5, on peut plot la table "smooth3valeurs" a la place)

# Calcul de la fréquence avec un pas de 2.5, puis normalisation pour avoir une valeur max a 1. Permet d'obtenir le graphe de densité
for y in axesy:
	compteur+=1
	for x in range (0,len(densitySucre)):
		if (densitySucre[x] < y and densitySucre[x] > (y-2.5)): # Calcul des fréquences avec pas de 2.5
			Frequence[compteur]+=1
maxi=max(Frequence) # On stocke la valeur max pour normaliser a 1.
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi # normalisation de toutes les valeurs

# Tracé de la courbe de densité moyenne suivant une fonction quadratique
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new, color='red',linewidth=3)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityMBBot = []
filename = "positionMBBot.csv" # Chargement
Frequence = [0]*len(axesy) # initialisation tableau Frequence a 0 partout
compteur=-1 # initialisation compteur
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityMBBot.append(-float(data[x][1])+float(densityCenter[x])) # Etapes identiques aux precedentes, ici on recentre l'intégralité des résultats en fonctions du centre de la membrane (ici quand le PGL est placé dans le feuillet inferieur)

# Smooth des valeurs en utilisant la moyenne de 11 données
smooth3valeurs=[]
for x in range (5,len(densityMBBot)-5):
	smooth3valeurs.append((densityMBBot[x-5]+densityMBBot[x-4]+densityMBBot[x-3]+densityMBBot[x-2]+densityMBBot[x-1]+densityMBBot[x]+densityMBBot[x+1]+densityMBBot[x+2]+densityMBBot[x+3]+densityMBBot[x+4]+densityMBBot[x+5])/11)
ax.plot(densityMBBot,color='darkgoldenrod',linewidth=1.5) # plot du tableau densitySucre en rouge, epaisseur 1.5, on peut plot la table "smooth3valeurs" a la place)

# Calcul de la fréquence avec un pas de 2.5, puis normalisation pour avoir une valeur max a 1.
for y in axesy:
	compteur+=1
	for x in range (0,len(densityMBBot)):
		if (densityMBBot[x] < y and densityMBBot[x] > (y-2.5)):# Calcul des fréquences avec pas de 2.5
			Frequence[compteur]+=1
maxi=max(Frequence)  # On stocke la valeur max pour normaliser a 1.
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi  # normalisation de toutes les valeurs

# Tracé de la courbe moyenne suivant une fonction quadratique
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new, color='darkgoldenrod',linewidth=3)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityMBTop = []
filename = "positionMBTop.csv"
Frequence = [0]*len(axesy)
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityMBTop.append(-float(data[x][1])+float(densityCenter[x]))

# Smooth des valeurs en utilisant la moyenne de 11 données
smooth3valeurs=[]
for x in range (5,len(densityMBTop)-5):
	smooth3valeurs.append((densityMBTop[x-5]+densityMBTop[x-4]+densityMBTop[x-3]+densityMBTop[x-2]+densityMBTop[x-1]+densityMBTop[x]+densityMBTop[x+1]+densityMBTop[x+2]+densityMBTop[x+3]+densityMBTop[x+4]+densityMBTop[x+5])/11)
ax.plot(densityMBTop,color='darkgoldenrod',linewidth=1.5)

# Calcul de la fréquence avec un pas de 2.5, puis normalisation pour avoir une valeur max a 1.
for y in axesy:
	compteur+=1
	for x in range (0,len(densityMBTop)):
		if (densityMBTop[x] < y and densityMBTop[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi

# Tracé de la courbe moyenne suivant une fonction quadratique
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new, color='darkgoldenrod',linewidth=3)


	
#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityPGL = []
Frequence = [0]*len(axesy)
filename = "positionPGL.csv"
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityPGL.append(-float(data[x][1])+float(densityCenter[x]))
smooth3valeurs=[]
for x in range (5,len(densityPGL)-5):
	smooth3valeurs.append((densityPGL[x-5]+densityPGL[x-4]+densityPGL[x-3]+densityPGL[x-2]+densityPGL[x-1]+densityPGL[x]+densityPGL[x+1]+densityPGL[x+2]+densityPGL[x+3]+densityPGL[x+4]+densityPGL[x+5])/11)
ax.plot(densityPGL,color='green',linewidth=1.5)

for y in axesy:
	compteur+=1
	for x in range (0,len(densityPGL)):
		if (densityPGL[x] < y and densityPGL[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new,color='green',linewidth=3)


#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityPhenyl = []
Frequence = [0]*len(axesy)
filename = "positionPhenyl.csv"
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityPhenyl.append(-float(data[x][1])+float(densityCenter[x]))
smooth3valeurs=[]
for x in range (5,len(densityPhenyl)-5):
	smooth3valeurs.append((densityPhenyl[x-5]+densityPhenyl[x-4]+densityPhenyl[x-3]+densityPhenyl[x-2]+densityPhenyl[x-1]+densityPhenyl[x]+densityPhenyl[x+1]+densityPhenyl[x+2]+densityPhenyl[x+3]+densityPhenyl[x+4]+densityPhenyl[x+5])/11)
ax.plot(densityPhenyl,color='orange',linewidth=1.5)

for y in axesy:
	compteur+=1
	for x in range (0,len(densityPhenyl)):
		if (densityPhenyl[x] < y and densityPhenyl[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new,color='orange',linewidth=3)
	
	
	
#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityTetePol = []
Frequence = [0]*len(axesy)
filename = "positionTetePol.csv"
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityTetePol.append(-float(data[x][1])+float(densityCenter[x]))
smooth3valeurs=[]
for x in range (5,len(densityTetePol)-5):
	smooth3valeurs.append((densityTetePol[x-5]+densityTetePol[x-4]+densityTetePol[x-3]+densityTetePol[x-2]+densityTetePol[x-1]+densityTetePol[x]+densityTetePol[x+1]+densityTetePol[x+2]+densityTetePol[x+3]+densityTetePol[x+4]+densityTetePol[x+5])/11)
ax.plot(densityTetePol,color='blue',linewidth=1.5)


for y in axesy:
	compteur+=1
	for x in range (0,len(densityTetePol)):
		if (densityTetePol[x] < y and densityTetePol[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new,color='blue',linewidth=3)


#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



densityChain1 = []
filename = "positionChain1.csv"
Frequence = [0]*len(axesy)
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityChain1.append(-float(data[x][1])+float(densityCenter[x]))

# Smooth des valeurs en utilisant la moyenne de 11 données
smooth3valeurs=[]
for x in range (5,len(densitySucre)-5):
	smooth3valeurs.append((densityChain1[x-5]+densityChain1[x-4]+densityChain1[x-3]+densityChain1[x-2]+densityChain1[x-1]+densityChain1[x]+densityChain1[x+1]+densityChain1[x+2]+densityChain1[x+3]+densityChain1[x+4]+densityChain1[x+5])/11)
ax.plot(densityChain1,color='black',linewidth=1.5)

# Calcul de la fréquence avec un pas de 2.5, puis normalisation pour avoir une valeur max a 1.
for y in axesy:
	compteur+=1
	for x in range (0,len(densitySucre)):
		if (densityChain1[x] < y and densityChain1[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi

# Tracé de la courbe moyenne suivant une fonction quadratique
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new, color='black',linewidth=3)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   




densityChain2 = []
filename = "positionChain2.csv"
Frequence = [0]*len(axesy)
compteur=-1
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	
for x in range (0, len(data)):
	densityChain2.append(-float(data[x][1])+float(densityCenter[x]))

# Smooth des valeurs en utilisant la moyenne de 11 données
smooth3valeurs=[]
for x in range (5,len(densitySucre)-5):
	smooth3valeurs.append((densityChain2[x-5]+densityChain2[x-4]+densityChain2[x-3]+densityChain2[x-2]+densityChain2[x-1]+densityChain2[x]+densityChain2[x+1]+densityChain2[x+2]+densityChain2[x+3]+densityChain2[x+4]+densityChain2[x+5])/11)
ax.plot(densityChain2,color='black',linewidth=1.5)

# Calcul de la fréquence avec un pas de 2.5, puis normalisation pour avoir une valeur max a 1.
for y in axesy:
	compteur+=1
	for x in range (0,len(densitySucre)):
		if (densityChain2[x] < y and densityChain2[x] > (y-2.5)):
			Frequence[compteur]+=1
maxi=max(Frequence)
for x in range (0,len(Frequence)):
	Frequence[x]=Frequence[x]/maxi

# Tracé de la courbe moyenne suivant une fonction quadratique
Frequence=np.array(Frequence)
axesy=np.array(axesy)
x_new = np.linspace(axesy.min(), axesy.max(),400)
f = interp1d(axesy, Frequence, kind='quadratic')
y_smooth=f(x_new)
bx.plot(y_smooth, x_new, color='black',linewidth=3)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



# Affichage, gestion de la figure
plt.tight_layout() # Optimise toute la mise en page de la figure
bx.axis([0,1.1 ,-30, 31]) # valeur min et valeur max du graphe b (densité)
ax.axis([0,len(densityCenter),-30, 30]) # valeur min et valeur max du graphe a 
bx.set_xlabel('Normalized density')
ax.set_xlabel('Time (ns)')
ax.set_ylabel('Z position (Å)')
bx.set_yticklabels([])
bx.set_xticklabels(["","","","","",""])
ax.set_xticklabels([0,"" ,350,"" ,700,"",1050,"",1400])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='off', labelleft='off')

plt.show()


# Liste des valeurs a modifier pour changer en fonction des figures #
# " maxi=max(Frequence) " -> il faut parfois diviser par un chiffre un peu plus grand, la valeur dépasse 1
# " ax.plot(XXX,color='XXX',linewidth=XXX) " -> Premier XXX = choix des données a afficher (tableau brut ou tableau smooth), choix de la couleur et de l'epaisseur ensuite
# "	densityChain2.append(-float(data[x][1])+float(densityCenter[x])) " -> inverser le + et le - dans le cas d'une simulation dans le bon sens. 








