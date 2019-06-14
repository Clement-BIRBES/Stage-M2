#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Script utilisant le fichier tableauInteractions
    pour créer les matrices d'interactions, et les plot"""
    # Script a finir en enlever aux matrices la valeur de la matrice fantome

############################################################################################################# 
########################################### Import ########################################################## 
############################################################################################################# 
import numpy as np
from numpy import loadtxt
import matplotlib
import matplotlib.pyplot as plt
from math import *
from itertools import chain
import seaborn as sns
from scipy import stats
import scipy

#############################################################################################################
#############################################################################################################
######################################### Function ##########################################################
#############################################################################################################
#############################################################################################################
# Plot with cbar
def heatmap(data, row_labels, col_labels, ax=None,
            cbar_kw={}, cbarlabel="", **kwargs):
    """
    Create a heatmap from a numpy array and two lists of labels.

    Arguments:
        data       : A 2D numpy array of shape (N,M)
        row_labels : A list or array of length N with the labels
                     for the rows
        col_labels : A list or array of length M with the labels
                     for the columns
    Optional arguments:
        ax         : A matplotlib.axes.Axes instance to which the heatmap
                     is plotted. If not provided, use current axes or
                     create a new one.
        cbar_kw    : A dictionary with arguments to
                     :meth:`matplotlib.Figure.colorbar`.
        cbarlabel  : The label for the colorbar
    All other arguments are directly passed on to the imshow call.
    """
    # On rentre jamais la dedans
    if not ax:
        ax = plt.gca()


    # Plot the heatmap
    im = ax.imshow(data, **kwargs,vmin=0,vmax=seuil)

    # Create colorbar
    cbar = ax.figure.colorbar(im, ax=ax, **cbar_kw)
    cbar.ax.set_ylabel(cbarlabel, rotation=-90, va="bottom")

    # We want to show all ticks...
    ax.set_xticks(np.arange(data.shape[1]))
    ax.set_yticks(np.arange(data.shape[0]))
    # ... and label them with the respective list entries.
    ax.set_xticklabels(col_labels)
    ax.set_yticklabels(row_labels,verticalalignment='bottom')

    # Let the horizontal axes labeling appear on top.
    ax.tick_params(top=False, bottom=True,
                   labeltop=False, labelbottom=True)

    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=-35, ha="left",
             rotation_mode="anchor")

    # Turn spines off and create white grid.
    for edge, spine in ax.spines.items():
        spine.set_visible(True)

    ax.set_xticks(np.arange(data.shape[1]+1)-.5, minor=True)
    ax.set_yticks(np.arange(data.shape[0]+1)-.5, minor=True)
    ax.grid(which="minor", color="w", linestyle='-', linewidth=4)
    ax.tick_params(which="minor", bottom=False, left=False)

    return im, cbar

# Plot without cbar
def heatmap2(data, row_labels, col_labels, ax=None,
             **kwargs):
    """
    Create a heatmap from a numpy array and two lists of labels.

    Arguments:
        data       : A 2D numpy array of shape (N,M)
        row_labels : A list or array of length N with the labels
                     for the rows
        col_labels : A list or array of length M with the labels
                     for the columns
    Optional arguments:
        ax         : A matplotlib.axes.Axes instance to which the heatmap
                     is plotted. If not provided, use current axes or
                     create a new one.
        cbar_kw    : A dictionary with arguments to
                     :meth:`matplotlib.Figure.colorbar`.
        cbarlabel  : The label for the colorbar
    All other arguments are directly passed on to the imshow call.
    """
    # On rentre jamais la dedans
    if not ax:
        ax = plt.gca()
	
    # Plot the heatmap
    im = ax.imshow(data, **kwargs,vmin=0,vmax=seuil)

    # We want to show all ticks...
    ax.set_xticks(np.arange(data.shape[1]))
    ax.set_yticks(np.arange(data.shape[0]))
    # ... and label them with the respective list entries.
    ax.set_xticklabels(col_labels)
    ax.set_yticklabels(row_labels)

    # Let the horizontal axes labeling appear on top.
    ax.tick_params(top=False, bottom=True,
    labeltop=False, labelbottom=True)

    # Rotate the tick labels and set their alignment.
    plt.setp(ax.get_xticklabels(), rotation=-35, ha="left",
             rotation_mode="anchor")

    # Turn spines off and create white grid.
    for edge, spine in ax.spines.items():
        spine.set_visible(True)

    ax.set_xticks(np.arange(data.shape[1]+1)-.5, minor=True)
    ax.set_yticks(np.arange(data.shape[0]+1)-.5, minor=True)
    ax.grid(which="minor", color="w", linestyle='-', linewidth=4)
    ax.tick_params(which="minor", bottom=False, left=False)
    
    return im
    
# Rend la heatmap plus joli
def annotate_heatmap(im, data=None, valfmt="{x:.2f}",
                     textcolors=["black", "white"],
                     threshold=None, **textkw):
    """
    A function to annotate a heatmap.

    Arguments:
        im         : The AxesImage to be labeled.
    Optional arguments:
        data       : Data used to annotate. If None, the image's data is used.
        valfmt     : The format of the annotations inside the heatmap.
                     This should either use the string format method, e.g.
                     "$ {x:.2f}", or be a :class:`matplotlib.ticker.Formatter`.
        textcolors : A list or array of two color specifications. The first is
                     used for values below a threshold, the second for those
                     above.
        threshold  : Value in data units according to which the colors from
                     textcolors are applied. If None (the default) uses the
                     middle of the colormap as separation.

    Further arguments are passed on to the created text labels.
    """
    if not isinstance(data, (list, np.ndarray)):
        data = im.get_array()

    # Normalize the threshold to the images color range.
    # On rentre jamais la dedans
    if threshold is not None:
        threshold = im.norm(threshold)
    else:
        # threshold = im.norm(data.max())/2.
        threshold = 0.5


    # Set default alignment to center, but allow it to be
    # overwritten by textkw.
    kw = dict(horizontalalignment="center",
              verticalalignment="center")
    kw.update(textkw)

    # Get the formatter in case a string is supplied
    if isinstance(valfmt, str):
        valfmt = matplotlib.ticker.StrMethodFormatter(valfmt)

    # Loop over the data and create a `Text` for each "pixel".
    # Change the text's color depending on the data.
    texts = []
    for i in range(data.shape[0]):
        for j in range(data.shape[1]):
            kw.update(color=textcolors[im.norm(data[i, j]) > threshold])
            text = im.axes.text(j, i, valfmt(data[i, j], None), **kw)
            texts.append(text)

    return texts
    
    
          ####################################################################################    
#############################################################################################################
#############################################################################################################
#################################### Fonction Matrice Interaction ###########################################
#############################################################################################################
#############################################################################################################   
          ####################################################################################
    
#############################################################################################################
#############################################################################################################
######################################## Variable Declaration ###############################################
#############################################################################################################
#############################################################################################################

filename = "tableauInteractions.txt"

data2 = []
dataPar100 = [] 														# dataPar100 = X list of 100 element
dataPar10 = [] 															# dataPar10 = X list of 10 list of 10 element
conserver = []
lecteurListex=[0]
lecteurListey=[]
lecteurTitre=[0]
moyenne=[]

PGL1=1
PGL2=2


y=0
o=0
liste=[1]


maxi=0


compteur1=2
compteur2=1
compteur3=0
compteur4=1
compteurPGL1=2
compteurPGL2=1

#############################################################################################################
#############################################################################################################
################################### Modification et lecture de l'input ######################################
#############################################################################################################
############################################################################################################# 

with open (filename) as f:
	data = f.read()
data = data.strip('\n')
data = data.split('\n')

for element in data :
	data2.append(int(element))

	
for x in range (0,len(data2),100):
	dataPar100.append(data2[x:x+100])

for x in range (0, len(dataPar100)):
	dataPar10.append([dataPar100[x][y:y+10] for y in range (0, len(dataPar100[x]),10)])


#############################################################################################################
#############################################################################################################
################################# Prise d'information à partir de l'input ###################################
#############################################################################################################
############################################################################################################# 

nbrMolecule = sqrt(len(dataPar100))
seuil=30 																# Seuil arbitraire
nbrMatrice = ((nbrMolecule-1)*(nbrMolecule-1)+(nbrMolecule-1))/2		# Nombre de matrice a conserver pour ne pas avoir les diagonales, ni la moitié haute de la "grande matrice"

# conserver = liste des matrices a conserver
for x in range (1, int((nbrMolecule*nbrMolecule)-1)):
	if x % nbrMolecule == 0:
		y = x+compteur1
		compteur1 += 1
	elif x>=y:
		conserver.append(x)

# maxi = valeur max dans les matrices conservé
for x in conserver:
	for y in range (0, len(dataPar10[x])):
		if maxi <= max(dataPar10[x][y]):
			maxi=max(dataPar10[x][y])


# liste = liste des plots a effecteur (avec subplot, on garde donc 1, 4, 5, 7, 8, 9 dans le cas de nbrMolecule=4)
for x in range (int(nbrMolecule)-1, int((nbrMolecule-1)*(nbrMolecule-1))+1):
	if float(x-1) % int(nbrMolecule) == 0 :	
		for p in range (x-compteur4,x+1):	
			liste.append(p)
		compteur4+=1

# lecteurListex = liste des plots situé tout en bas dans la figure (les X derniers a plot)
for x in range (1,int(nbrMolecule-1)):
	lecteurListex.append(int((x*(x+1))/2))

# lecteurListey = liste  des plots situé a gauche dans la figure
for x in range (1,int(nbrMolecule)):
	lecteurListey.append(int((nbrMolecule-1)*(nbrMolecule-1))-compteur3)
	compteur3+=1

# lecteurTitre = liste des plots situé en tete de colonne	
for x in range (1,int(nbrMolecule-1)):
	lecteurTitre.append(int((x*(x+1))/2)+compteur2)
	compteur2+=1

#############################################################################################################
################################# Plot de toutes les matrices importantes ###################################
#############################################################################################################
#~ for items in conserver :
	#~ # Convert data to array 
	#~ matrice0=np.array(dataPar10[items])

	#~ # create the plot in good position
	#~ ax = plt.subplot(int(nbrMolecule-1),int(nbrMolecule-1),liste[o])
	#~ fig = plt.subplot(int(nbrMolecule-1),int(nbrMolecule-1),liste[o])
	
	#~ # si le plot est a gauche, on met un titre a gauche et on actualise lalegende de gauche
	#~ if o in lecteurListex:
		#~ ax.set_title(str("PGL " +str(compteurPGL1)),rotation='vertical', x=-0.3, y=0.5)
		#~ axesx = ["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"]
		#~ compteurPGL1+=1
	#~ else : axesx = [""]
	
	#~ # si le plot est en bas, on actualise la legende du bas
	#~ if liste[o] in lecteurListey:
		#~ axesy = ["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"] 
	#~ else : axesy = [""]
	
	#~ # On plot, si c'est le dernier plot, on affiche une scalebar, sinon non
	#~ if liste[o] == liste[-1]:
		#~ im, _ = heatmap(matrice0, axesx, axesy, ax=ax, cmap="Reds", cbarlabel="number of interactions")
		#~ annotate_heatmap(im, valfmt="{x:.1f}", size=7)
	#~ else :
		#~ im = heatmap2(matrice0, axesx, axesy, ax=ax, cmap="Reds")
		#~ annotate_heatmap(im, valfmt="{x:.1f}", size=7)
	
	#~ # on ajoute un titre sur les tetes de colonnes
	#~ if o in lecteurTitre:
		#~ ax.text(x=3.4,y=-1.4,s=str("PGL " +str(compteurPGL2)),fontsize=16)
		#~ compteurPGL2+=1
	#~ o+=1
	#~ PGL2+=1
	#~ if (PGL2 > nbrMolecule):
		#~ PGL1+=1
		#~ PGL2 = PGL1+1

#############################################################################################################
##################### Calcul matrice totale (addition des X matrices de conserver) ##########################
#############################################################################################################
for x in range (0, int(nbrMolecule*nbrMolecule)):
	matrice0=np.array(dataPar10[x])
	if x % (nbrMolecule+1) !=0:
		if moyenne == []:
			moyenne = matrice0
		else:
			moyenne += matrice0

		
#############################################################################################################
##################### Plot  matrice totale (addition des X matrices de conserver) ###########################
#############################################################################################################	
seuil = int(moyenne[0][0])/2											# Valeur intéraction SucreSucre /2
figure = plt.figure(figsize = (20, 20))
axesx=["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"]
axesy=["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"]
ax = plt.subplot(1,1,1)
fig = plt.subplot(1,1,1)
ax.set_title(str("Matrice des interactions totale sur 302 frames"))
im, _ = heatmap(moyenne, axesx, axesy, ax=ax, cmap="Reds", cbarlabel="Number of interactions")
annotate_heatmap(im, valfmt="{x:.1f}", size=7)


#############################################################################################################
################################ Sortie fichiers image représentative #######################################
#############################################################################################################
matrice01=[]
for z in range (2,11,2):
	fichier = open("matriceImageRepresentative_%s" %z, "w")
	limite= int(moyenne[0][0])/z
	for x in range (0, len(moyenne)):
		if x != 0:
			fichier.write("\n")
		for y in range (0, len(moyenne[x])):
			if moyenne[x][y] < limite :
				matrice01.append(0)
				fichier.write("0 ")
			else:
				matrice01.append(1)
				fichier.write("1 ")
	fichier.close

#############################################################################################################
######################################### Plot matrice moyenne ##############################################
#############################################################################################################

seuil = 30																# Seuil arbitraire
figure2 = plt.figure(figsize = (20, 20))
axesx=["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"]
axesy=["Sucre","Phenyl","MiC1","DebutC1","DebutC2","DebutC3","MiC2","MiC3","FinC2","FinC3"]
moyenne = moyenne/int(nbrMolecule*nbrMolecule)
ax = plt.subplot(1,1,1)
fig = plt.subplot(1,1,1)
ax.set_title(str("Matrice moyenne des interactions sur 302 frames"))
im, _ = heatmap(moyenne, axesx, axesy, ax=ax, cmap="Reds", cbarlabel="Number of interactions")
annotate_heatmap(im, valfmt="{x:.1f}", size=7)

plt.show()		



          ####################################################################################    
#############################################################################################################
#############################################################################################################
########################### Fonction Matrice Interaction au cours du temps ##################################
#############################################################################################################
#############################################################################################################   
          ####################################################################################
          
# Input
data = loadtxt("tableauInteractionsTime.txt")

# Input Information and Variable declaration
nombreMolecule = (sqrt(len(data)/100))
frame= len(data[0])
dataSplit = [data[x:x+700] for x in range(0, len(data),700)]

moyennePGL = []
moyenneGlobale = []

################################################
# Initialisation moyennePGL and moyenneGlobale #
################################################
for k in range (0, int(nombreMolecule+1)):
	moyennePGL.append([])
	for x in range (0, 100):
		moyennePGL[k].append([])
		for y in range (0,frame):
			moyennePGL[k][x].append([])
			
for x in range (0, 100):
	moyenneGlobale.append([])
	for y in range (0,frame):
		moyenneGlobale[x].append([])
			
################################################
## Si interaction, case = 1, sinon case = 0   ##
################################################		
for k in range (0, int(nombreMolecule+1)):
	for x in range (0, 100):
		for y in range (0,frame):
			for z in range (0,int(nombreMolecule-1)):
				if (dataSplit[k][x+z*100][y])==1:
					moyennePGL[k][x][y]=1
					break
				else: moyennePGL[k][x][y]=0

################################################
##    Moyenne sur l'ensemble des matrices     ##
################################################
				
for k in range (0, int(nombreMolecule)):
	for x in range (0, 100):
			for y in range (0,frame):
				if ((moyennePGL[k][x][y]) == 1):
					moyenneGlobale[x][y].append(1)					
for x in range (0, 100):
			for y in range (0,frame):
				if (len(moyenneGlobale[x][y]) >= nombreMolecule/2):
					moyenneGlobale[x][y]= 1
				else:
					moyenneGlobale[x][y]= 0

labels=["","","","","Sucre","","","","","----","","","","","Phenyl","","","","","----","","","","","MiC1","","","","","----","","","","","DebutC1","","","","","----","","","","","DebutC2","","","","","----","","","","","DebutC3","","","","","----","","","","","MiC2","","","","","----","","","","","MiC3","","","","","----","","","","","FinC2","","","","","----","","","","","FinC3","","","","","----"]

################################################
##   				 Plots   				  ##
################################################
#~ plt.imshow(moyenneGlobale, interpolation='nearest', cmap=plt.cm.binary)
#~ plt.yticks(range(100), labels)
#~ plt.show()

#~ for x in range (0, int(nombreMolecule)):
	#~ plt.imshow(moyennePGL[x], interpolation='nearest', cmap=plt.cm.binary)
	#~ plt.yticks(range(100), labels)
	#~ plt.show()


#############################################################################################################
#############################################################################################################
########################################### Fin du script ###################################################
#############################################################################################################
#############################################################################################################
print ("Fin du script")
    
