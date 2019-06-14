# Script permettant de classer la répartition des angles obtenues en suivant un tableau de fréquence de pas 0.9
ValFrequence=[]
frequence = [0]*100
liste =[]
compteur = 0
a = 0
while (a <=90) :														
	ValFrequence.append(a)
	a += 0.9

filename = "dist_angle_POPC_340K_25DIM25PGL.dat"

with open (filename) as f:
	data = f.read()
	
data = data.split('\n')

del data[-1]
for x in range (0,len(data)):
	liste.append(data[x])

for x in ValFrequence:
	for y in range (0,len(data)):
		if ((float(liste[y])>x) and (float(liste[y])<x+0.9)):
			frequence[compteur]+=1
	compteur +=1
	
print (frequence)
fichier = open ("dist_angle_POPC_340K_25DIM25PGL_Freq.dat","w")
for x in frequence:
	fichier.write(str(x)+"\n")
fichier.close()


frequence = [0]*100
liste =[]
compteur = 0
filename = "dist_angle_DOPE_340K_25DIM25PGL.dat"

with open (filename) as f:
	data = f.read()
	
data = data.split('\n')

del data[-1]
for x in range (0,len(data)):
	liste.append(data[x])

for x in ValFrequence:
	for y in range (0,len(data)):
		if ((float(liste[y])>x) and (float(liste[y])<x+0.9)):
			frequence[compteur]+=1
	compteur +=1
	
print (frequence)
fichier = open ("dist_angle_DOPE_340K_25DIM25PGL_Freq.dat","w")
for x in frequence:
	fichier.write(str(x)+"\n")
fichier.close()
	

			 
