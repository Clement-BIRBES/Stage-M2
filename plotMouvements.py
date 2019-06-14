# Script pour plot les distances extrémités-centre des lipides (PGL ou POPC)
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import interp1d
from matplotlib import gridspec
import seaborn as sns


CentreCoordX = [] # Coordonées X du centre
CentreCoordY = [] # Coordonées Y du centre
mouvCoordX = [] # Coordonées X de l'extrémité (update pour chaque extrémités)
mouvCoordY = [] # Coordonées Y de l'extrémité (update pour chaque extrémités)

figure = plt.figure(figsize = (12, 12))
ax = plt.subplot(3,2,1) # On coupe la figure en 3 lignes et 2 colonnes, a = l'image 1 (en haut a gauche)
bx = plt.subplot(3,2,3) # On coupe la figure en 3 lignes et 2 colonnes, b = l'image 3 (milieu a gauche)
cx = plt.subplot(3,2,5) # On coupe la figure en 3 lignes et 2 colonnes, c = l'image 5 (en bas a gauche)

dx = plt.subplot(3,2,2) # On coupe la figure en 3 lignes et 2 colonnes, d = l'image 2 (en haut a droite)
fx = plt.subplot(3,2,6) # On coupe la figure en 3 lignes et 2 colonnes, f = l'image 6 (en bas a droite)


filename = "positionCentre.csv" # On ouvre le fichier contenant les positions centrales du lipide
with open (filename) as f:
	data = f.read()
data = data.split('\n') # On separe en lignes 
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	# On separe les lignes avec des colonnes
del data[0]	
del data[len(data)-1]	# On supprime les valeurs 0 et finale (dédoublées)

for x in range (0, len(data)):
	CentreCoordX.append(float(data[x][0])) # On remplit un tableau avec les valeurs X
	CentreCoordY.append(float(data[x][1])) # On remplit un tableau avec les valeurs Y



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



filename = "positionTetePol.csv" # Chargement
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	# Préparation de l'input

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x])) # On utilise la coordonées de l'extrémité et on soustrait la valeur centrale pour juste conserver la distance
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x])) # On utilise la coordonées de l'extrémité et on soustrait la valeur centrale pour juste conserver la distance
y=len(mouvCoordX) # On stocke le nombre 
while (x < y):
	if ((mouvCoordX[x] < 15) and (mouvCoordX[x] > -15) and (mouvCoordY[x] < 15) and (mouvCoordY[x] > -15)): # On supprime les mouvements extremes impossible
		del mouvCoordX[x]
		del mouvCoordY[x]
		y=len(mouvCoordX)
	else :
		x +=1
sns.kdeplot(mouvCoordX, mouvCoordY, cmap="Reds", shade=True,n_levels=1000, bw= 0.1, ax=ax, shade_lowest=False) # On plot, en réalisant 1000 dégradés de couleurs.



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   


# On repete pour le Sucre
mouvCoordX = []
mouvCoordY = []
filename = "positionSucre.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
y=len(mouvCoordX)
while (x < y):
	if ((mouvCoordX[x] < 40) and (mouvCoordX[x] > -40) and (mouvCoordY[x] < 40) and (mouvCoordY[x] > -40)):
		del mouvCoordX[x]
		del mouvCoordY[x]
		y=len(mouvCoordX)
	else :
		x +=1
sns.kdeplot(mouvCoordX, mouvCoordY, cmap="Reds", shade=True,n_levels=1000, bw= 0.1, ax=bx, shade_lowest=False)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

	
# On repete pour les chaines carbonées sans Sucre
mouvCoordX = []
mouvCoordY = []
filename = "positionChain1.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
	

filename = "positionChain2.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
y=len(mouvCoordX)
while (x < y):
	if ((mouvCoordX[x] < 45) and (mouvCoordX[x] > -45) and (mouvCoordY[x] < 45) and (mouvCoordY[x] > -45)):
		del mouvCoordX[x]
		del mouvCoordY[x]
		y=len(mouvCoordX)
	else :
		x +=1
sns.kdeplot(mouvCoordX, mouvCoordY, cmap="Reds", shade=True,n_levels=1000, bw= 0.1, ax=cx, shade_lowest=False)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   
# On fait l'équivalent pour POPC

		
CentreCoordX = []
CentreCoordY = []
mouvCoordX = []
mouvCoordY = []
		
filename = "positionCentrePOPC.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	CentreCoordX.append(float(data[x][0]))
	CentreCoordY.append(float(data[x][1]))



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   



filename = "positionTetePOPC.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
y=len(mouvCoordX)
while (x < y):
	if ((mouvCoordX[x] < 15) and (mouvCoordX[x] > -15) and (mouvCoordY[x] < 15) and (mouvCoordY[x] > -15)):
		del mouvCoordX[x]
		del mouvCoordY[x]
		y=len(mouvCoordX)
	else :
		x +=1

sns.kdeplot(mouvCoordX, mouvCoordY, cmap="Blues", shade=True,n_levels=1000, bw= 0.1, ax=dx, shade_lowest=False)


	
#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   


	
mouvCoordX = []
mouvCoordY = []
filename = "positionChain1POPC.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
	

filename = "positionChain2POPC.csv"
with open (filename) as f:
	data = f.read()
data = data.split('\n')
for x in range (0, len(data)):
	data[x]=data[x].split(" ")	
del data[0]	
del data[len(data)-1]	

for x in range (0, len(data)):
	mouvCoordX.append(float(data[x][0])-(CentreCoordX[x]))
	mouvCoordY.append(float(data[x][1])-(CentreCoordY[x]))
y=len(mouvCoordX)
while (x < y):
	if ((mouvCoordX[x] < 45) and (mouvCoordX[x] > -45) and (mouvCoordY[x] < 45) and (mouvCoordY[x] > -45)):
		del mouvCoordX[x]
		del mouvCoordY[x]
		y=len(mouvCoordX)
	else :
		x +=1

sns.kdeplot(mouvCoordX, mouvCoordY, cmap="Blues", shade=True, n_levels=1000, bw= 0.1, ax=fx, shade_lowest=False)



#   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   #   

		
		
ax.axis([-35,35 ,-35, 35])
bx.axis([-35,35 ,-35, 35])
cx.axis([-35,35 ,-35, 35])
dx.axis([-35,35 ,-35, 35])
fx.axis([-35,35 ,-35, 35])
ax.set_xticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
ax.set_yticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
bx.set_xticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
bx.set_yticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
cx.set_xticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
cx.set_yticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
dx.set_xticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
dx.set_yticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
fx.set_xticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
fx.set_yticklabels(["-4","-3","-2","-1","0","1","2","3","4"])
ax.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
bx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
cx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
dx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')
fx.tick_params(axis='both', which='both', bottom='on', top='off', labelbottom='on', right='off', left='on', labelleft='on')

ax.set_xlabel('X (nm)')
ax.set_ylabel('Y (nm)')
bx.set_xlabel('X (nm)')
bx.set_ylabel('Y (nm)')
cx.set_xlabel('X (nm)')
cx.set_ylabel('Y (nm)')
dx.set_xlabel('X (nm)')
dx.set_ylabel('Y (nm)')
fx.set_xlabel('X (nm)')
fx.set_ylabel('Y (nm)')
ax.set_title("GB1 Terminal PGL")
bx.set_title("Sucre PGL")
cx.set_title("C7 Terminaux PGL")
dx.set_title("NC3 Terminal POPC")
fx.set_title("C4 Terminaux POPC")

plt.show()	


	
