# Realise la matrice d'interaction pour toutes les zones du PGL ( 10 zones)
# Matrice interactions au cours du temps également (inutilisable vu que données binaires, trouver une autre méthode de calculs)
global molid1
set molid1 [mol new {../step7_production8PGL.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {../step7_production.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid1
source /home/birbes/Documents/Scripts/plot_N0.tcl

# Lecture des informations
global nf
set nf [molinfo top get numframes]
puts "nf = $nf"

# Set global variables
global i
set i 3411

global nombrePGL
set nombrePGL 4	

global nombreMoinsUn														
set nombreMoinsUn [expr $nombrePGL -1]

global limite
set limite [expr $i + $nombreMoinsUn]

##########################################################################################################
##########################################################################################################
############################### Fonctions (lancement a la fin du fichier) ################################
##########################################################################################################
##########################################################################################################
# Fonction interaction (matrice totale d'interactions)
proc interactions {} {
	global nf
	global tableauInter
	set tableauInter ""
	set Sucre "B1 B2 B3"
	set Phenyl "C7A C8A C9A CXA"
	set MiC1 "C4A C5A C6A"
	set DebutC1 "GB1 C1A C2A"
	set DebutC2 "C3A GL1 C1B"
	set DebutC3 "C3A GL2 C1C"
	set MiC2 "C4B C3B C2B"
	set MiC3 "C4C C3C C2C"
	set FinC2 "C7B C6B C5B"
	set FinC3 "C7C C6C C5C"
	global molid1
	global outputFile
	global nombrePGL
	global nombreMoinsUn
	global limite
	
	set outputFile [open tableauInteractions.txt w]
	for { set i 3411 } { $i <= $limite } { incr i 1 } {
		for { set j 3411  } { $j <= $limite } { incr j 1 } {
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $Sucre) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1     
				
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $Phenyl) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $MiC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $DebutC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
									
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $DebutC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $DebutC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $MiC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $MiC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
			plot_interactions $molid1 "(name $FinC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
			
			plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
			plot_interactions $molid1 "(name $FinC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
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
}



# Fonction interaction au cours du temps (matrice binaire)
proc interactions_time {} {
	global nf
	global tableauInter
	set tableauInter ""
	global outputFile
	set outputFile [open tableauInteractionsTime.txt w]
	set Sucre "B1 B2 B3"
	set Phenyl "C7A C8A C9A CXA"
	set MiC1 "C4A C5A C6A"
	set DebutC1 "GB1 C1A C2A"
	set DebutC2 "C3A GL1 C1B"
	set DebutC3 "C3A GL2 C1C"
	set MiC2 "C4B C3B C2B"
	set MiC3 "C4C C3C C2C"
	set FinC2 "C7B C6B C5B"
	set FinC3 "C7C C6C C5C"
	global molid1
	global outputFile
	global nombrePGL
	global nombreMoinsUn
	global limite
	
	for { set i 3411 } { $i <= $limite } { incr i 1 } {
		for { set j 3411  } { $j <= $limite } { incr j 1 } { 
			if {$j != $i} {
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $Sucre) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
				
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $Phenyl) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $MiC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $DebutC1) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $DebutC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $DebutC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $MiC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $MiC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $FinC2) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1
								
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $Sucre) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $Phenyl) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $MiC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $DebutC1) and resid $j" 0 $nf 1  
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $DebutC2) and resid $j" 0 $nf 1   
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $DebutC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $MiC2) and resid $j" 0 $nf 1      
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $MiC3) and resid $j" 0 $nf 1 
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $FinC2) and resid $j" 0 $nf 1     
				plot_interactions_time $molid1 "(name $FinC3) and resid $i" "(name $FinC3) and resid $j" 0 $nf 1     
			}                                  
		}
	}
	close $outputFile
}

##########################################################################################################
############################################ Run fonctions ###############################################
##########################################################################################################

interactions
interactions_time

#Pour prendre les valeurs dans le tableau : D=Dizaine, U=unité, P1=identifiant du PGL1 (de 0 a $nombreMoinsUn), P2=identifiant du PGL2 (de 0 a $nombreMoinsUn)
# DebutC1 "GB1 C1A C2A"         0
# FinC2 "C7B C6B C5B"           1
# FinC3 "C7C C6C C5C"			2
# MiC2 "C4B C3B C2B"			3
# MiC3 "C4C C3C C2C"			4
# DebutC2 "C3A GL1 C1B"			5
# DebutC3 "C3A GL2 C1C"			6
# MiC1 "C4A C5A C6A"			7
# Phenyl "C7A C8A C9A CXA"		8
# Sucre "B1 B2 B3"				9

# Pour avoir valeur DebutC1 FinC2 PGL0 vs PGL0 -> puts [lindex $tableauInter 01] ($D$U)
# Pour avoir valeur FinC3 FinC2 PGL0 vs PGL3  -> puts [lindex $tableauInter 1221]($P1*100+$P2*400+$D$U)


### Tableau interaction au cours du temps









