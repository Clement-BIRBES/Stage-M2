# Jamais utilisé
import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

list_angle=[]

file = open('/data/DIM/DIM_CG_short_V3/4_layers_2916/10perc_lysoPC_2_5perc_DIM/run/dist_angle_DOPE_350K_25DIM_10LYSO.dat', "r")

for line in file.readlines():

    line_values = line.split()
    values = [float(x) for x in line_values]
    list_angle.append(values[0])
    
fig = plt.figure(figsize=(8.5, 7))
ax = fig.add_subplot(111)

N_bins =100
length=90
name_file="dist_DOPE_350K_25DIM_10LYSO"

binning=np.linspace(0,length,N_bins+1)


counts, bin_edges, ignored = ax.hist(list_angle, N_bins, histtype='stepfilled', label='histogram' )

#print(counts)
#print(bin_edges)

file_dat = open(name_file+".dat",'w') 

for i in range(0,len(counts)):
    file_dat.write(str(round(binning[i], 2))+"\t"+str(counts[i])+"\n")

file_dat.close()
plt.xlim(0,length)

fig.savefig(name_file+".svg", dpi=200)
