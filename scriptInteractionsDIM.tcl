# Realise la matrice d'interaction pour toutes les zones du DIM ( 9 zones)
set molid1 [mol new {/home/birbes/Documents/DIM/SimulationDIM/8_DIM_MB/step7_production8DIM.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {/home/birbes/Documents/DIM/SimulationDIM/8_DIM_MB/step7_production8DIM.xtc} type {xtc} first 0 last -1 step 10 waitfor -1 $molid1

set nf [molinfo top get numframes]
puts "nf = $nf"

set FinC1 "C5A C6A C7A"
set MiC1 "C2A C3A C4A "
set DebutC1 "GB1 C1A C2A"
set DebutC2 "C2A GL1 C1B"
set DebutC3 "C2A GL2 C1C"
set MiC2 "C4B C3B C2B"
set MiC3 "C4C C3C C2C"
set FinC2 "C7B C6B C5B"
set FinC3 "C7C C6C C5C"

source /home/birbes/Documents/Scripts/plot_N0.tcl

set nombreDIM 8
set nombreMoinsUn [expr $nombreDIM -1]
set i 3411
set limite [expr $i + $nombreMoinsUn]

global tableauInter
set tableauInter ""
global outputFile
set outputFile [open tableauInteractions.txt w]


for { set i 3411 } { $i <= $limite } { incr i 1 } {
	for { set j 3411  } { $j <= $limite } { incr j 1 } {
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $FinC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
		
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $FinC1) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
		plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
	}
}
close $outputFile
