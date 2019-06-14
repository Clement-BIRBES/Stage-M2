source /home/birbes/Documents/Scripts/plot_N0.tcl

#calculate the bond distances for AT and CG:
set molid1 0
set molid2 1

set molid1 [mol new {/home/birbes/Montage/kyoto/Data/PGL1/DynamiqueMembrane/InsertionPyMol/sysNoWater.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]
mol addfile {/home/birbes/Montage/kyoto/Data/PGL1/DynamiqueMembrane/InsertionPyMol/Simu1us/Dynamique1us.trr} type {trr} first 500 last -1 step 1 waitfor -1 $molid1

set molid2 [mol new {/home/birbes/Montage/leeds/Documents/RunGromacs/step7PGLdansMB/V6/step6.6_equilibration.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {/home/birbes/Montage/leeds/Documents/RunGromacs/step7PGLdansMB/V6/step7_production.xtc} type {xtc} first 300 last -1 step 1 waitfor -1 $molid2

set GB1 "C58 O2 C57 C999"       #N0
set C1A "C56 C55 C59"           #C1
set C2A "C54 C53 C52 C51"       #C1
set C3A "C51 C50 C49 C32"       #C1
set C4A "C32 C33 C34 C35 C36"   #C1
set C5A "C36 C37 C38 C39 C40"   #C1
set C6A "C40 C41 C42 C43 C44"   #C1
set C7A "C44 C45 C46 C47 C48"   #C1
set SC41 "C92 C95"              #SC4
set SC42 "C96 C97"              #SC4
set SC43 "C93 C94"              #SC4
set B2 "O999 C98 C101 O5 O6"    #P2
set B1 "C102 C103"              #Nda ou Na
set B3 "O7 C99 C100 C104 O8"    #P3 ou P2

set GL1 "C50 C60 O3 O4"         #Na
set C1B "C60 C61 C63 C64"       #SC1
set C2B "C64 C66 C67 C69 C70"   #C1
set C3B "C70 C72 C73 C74 C75"   #C1
set C4B "C75 C76 C77 C78 C79"   #C1
set C5B "C79 C80 C81 C82 C83"   #C1
set C6B "C83 C84 C85 C86 C87"   #C1
set C7B "C87 C88 C89 C90 C91"   #C1

set GL2 "O1 O C C32"            #Na
set C1C "C32 C1 C2 C3"          #SC1
set C2C "C3 C4 C5 C6 C7"        #C1
set C3C "C7 C8 C9 C10 C11"      #C1
set C4C "C11 C12 C13 C14 C15"   #C1
set C5C "C15 C16 C17 C18 C19"   #C1
set C6C "C19 C20 C21 C22 C23"   #C1
set C7C "C23 C24 C25 C26 C27"   #C1

####################################
##### Plots for LEG1 distances #####
####################################
#plot AT and CG distances GB1-C1A:
puts "GB1-C1A:"
 plot_distance $molid1 "(name $GB1) and resname PGL" "(name $C1A) and resname PGL" 1 4939 1 GB1_C1A_AT_dist
 plot_distance $molid2 "type GB1 and resname PGL" "type C1A and resname PGL" 0 2702 1 GB1_C1A_CG_dist
puts "\n\n"

#plot AT and CG distances C1A-C2A:
puts "C1A-C2A:"
 plot_distance $molid1 "(name $C1A) and resname PGL" "(name $C2A) and resname PGL" 1 5440 1 C1A_C2A_AT_dist
 plot_distance $molid2 "type C2A and resname PGL" "type C1A and resname PGL" 0 2702 1 C1A_C2A_CG_dist
puts "\n\n"


#plot AT and CG distances C2A-C3A:
puts "C2A-C3A:"
 plot_distance $molid1 "(name $C2A) and resname PGL" "(name $C3A) and resname PGL" 1 5440 1 C2A_C3A_AT_dist
 plot_distance $molid2 "type C3A and resname PGL" "type C2A and resname PGL" 0 2702 1 C2A_C3A_CG_dist
puts "\n\n"


#plot AT and CG distances C3A-C4A:
puts "C3A-C4A:"
 plot_distance $molid1 "(name $C3A) and resname PGL" "(name $C4A) and resname PGL" 1 5440 1 C3A_C4A_AT_dist
 plot_distance $molid2 "type C3A and resname PGL" "type C4A and resname PGL" 0 2702 1 C3A_C4A_CG_dist
puts "\n\n"

#plot AT and CG distances C4A-C5A:
puts "C4A-C5A:"
 plot_distance $molid1 "(name $C4A) and resname PGL" "(name $C5A) and resname PGL" 1 5440 1 C4A_C5A_AT_dist
 plot_distance $molid2 "type C5A and resname PGL" "type C4A and resname PGL" 0 2702 1 C4A_C5A_CG_dist
puts "\n\n"


#plot AT and CG distances C5A-C6A:
puts "C5A-C6A:"
 plot_distance $molid1 "(name $C5A) and resname PGL" "(name $C6A) and resname PGL" 1 5440 1 C5A_C6A_AT_dist
 plot_distance $molid2 "type C5A and resname PGL" "type C6A and resname PGL" 0 2702 1 C5A_C6A_CG_dist
puts "\n\n"


#plot AT and CG distances C6A-C7A: 
puts "C6A-C7A:"
 plot_distance $molid1 "(name $C6A) and resname PGL" "(name $C7A) and resname PGL" 1 5440 1 C6A_C7A_AT_dist
 plot_distance $molid2 "type C6A and resname PGL" "type C7A and resname PGL" 0 2702 1 C6A_C7A_CG_dist
puts "\n\n"

############################################
##### Plots for Sugar-Phenyl distances #####
############################################
#plot AT and CG distances C7A-SC41: 
puts "SC41-C7A:"
 plot_distance $molid1 "(name $SC41) and resname PGL" "(name $C7A) and resname PGL" 1 5440 1 SC41_C7A_AT_dist
 plot_distance $molid2 "type C9A and resname PGL" "type C7A and resname PGL" 0 2702 1 SC41_C7A_CG_dist
puts "\n\n"

#plot AT and CG distances SC41-SC42: 
puts "SC41-SC42:"
 plot_distance $molid1 "(name $SC41) and resname PGL" "(name $SC42) and resname PGL" 1 5440 1 SC41_SC42_AT_dist
 plot_distance $molid2 "type C9A and resname PGL" "type CXA and resname PGL" 0 2702 1 SC41_SC42_CG_dist
puts "\n\n"

#plot AT and CG distances SC41-SC43: 
puts "SC41-SC43:"
 plot_distance $molid1 "(name $SC41) and resname PGL" "(name $SC43) and resname PGL" 1 5440 1 SC41_SC43_AT_dist
 plot_distance $molid2 "type C9A and resname PGL" "type C8A and resname PGL" 0 2702 1 SC41_SC43_CG_dist
puts "\n\n"

#plot AT and CG distances SC42-SC43: 
puts "SC42-SC43:"
 plot_distance $molid1 "(name $SC42) and resname PGL" "(name $SC43) and resname PGL" 1 5440 1 SC42_SC43_AT_dist
 plot_distance $molid2 "type CXA and resname PGL" "type C8A and resname PGL" 0 2702 1 SC42_SC43_CG_dist
puts "\n\n"

#plot AT and CG distances SC42-B2: 
puts "SC42-B2:"
 plot_distance $molid1 "(name $SC42) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 SC42_B2_AT_dist
 plot_distance $molid2 "type CXA and resname PGL" "type B2 and resname PGL" 0 2702 1 SC42_B2_CG_dist
puts "\n\n"

#plot AT and CG distances B1-B2: 
puts "B1-B2:"
 plot_distance $molid1 "(name $B1) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 B1_B2_AT_dist
 plot_distance $molid2 "type B1 and resname PGL" "type B2 and resname PGL" 0 2702 1 B1_B2_CG_dist
puts "\n\n"

#plot AT and CG distances B3-B2: 
puts "B3-B2:"
 plot_distance $molid1 "(name $B3) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 B3_B2_AT_dist
 plot_distance $molid2 "type B3 and resname PGL" "type B2 and resname PGL" 0 2702 1 B3_B2_CG_dist
puts "\n\n"


####################################
##### Plots for LEG2 distances #####
####################################
#plot AT and CG distances C3A-GL1:
puts "C3A-GL1:"
 plot_distance $molid1 "(name $C3A) and resname PGL" "(name $GL1) and resname PGL" 1 5440 1 C3A_GL1_AT_dist
 plot_distance $molid2 "type C3A and resname PGL" "type GL1 and resname PGL" 0 2702 1 C3A_GL1_CG_dist
puts "\n\n"


#plot AT and CG distances GL1-C1B:
puts "GL1-C1B:"
 plot_distance $molid1 "(name  $GL1) and resname PGL" "(name $C1B) and resname PGL" 1 5440 1 GL1_C1B_AT_dist
 plot_distance $molid2 "type C1B and resname PGL" "type GL1 and resname PGL" 0 2702 1 GL1_C1B_CG_dist
puts "\n\n"


#plot AT and CG distances C1B-C2B:
puts "C1B-C2B:"
 plot_distance $molid1 "(name  $C1B) and resname PGL" "(name $C2B) and resname PGL" 1 5440 1 C1B_C2B_AT_dist
 plot_distance $molid2 "type C1B and resname PGL" "type C2B and resname PGL" 0 2702 1 C1B_C2B_CG_dist
puts "\n\n"


#plot AT and CG distances C2B-C3B:
puts "C2B-C3B:"
 plot_distance $molid1 "(name  $C2B) and resname PGL" "(name $C3B) and resname PGL" 1 5440 1 C2B_C3B_AT_dist
 plot_distance $molid2 "type C2B and resname PGL" "type C3B and resname PGL" 0 2702 1 C2B_C3B_CG_dist
puts "\n\n"


#plot AT and CG distances C3B-C4B:
puts "C3B-C4B:"
 plot_distance $molid1 "(name  $C3B) and resname PGL" "(name $C4B) and resname PGL" 1 5440 1 C3B_C4B_AT_dist
 plot_distance $molid2 "type C3B and resname PGL" "type C4B and resname PGL" 0 2702 1 C3B_C4B_CG_dist
puts "\n\n"


#plot AT and CG distances C4B-C5B:
puts "C4B-C5B:"
 plot_distance $molid1 "(name  $C4B) and resname PGL" "(name $C5B) and resname PGL" 1 5440 1 C4B_C5B_AT_dist
 plot_distance $molid2 "type C4B and resname PGL" "type C5B and resname PGL" 0 2702 1 C4B_C5B_CG_dist
puts "\n\n"


#plot AT and CG distances C5B-C6B:
puts "C5B-C6B:"
 plot_distance $molid1 "(name $C5B) and resname PGL" "(name $C6B) and resname PGL" 1 5440 1 C5B_C6B_AT_dist
 plot_distance $molid2 "type C5B and resname PGL" "type C6B and resname PGL" 0 2702 1 C5B_C6B_CG_dist
puts "\n\n"


#plot AT and CG distances C6B-C7B:
puts "C6B-C7B:"
 plot_distance $molid1 "(name $C6B) and resname PGL" "(name $C7B) and resname PGL" 1 5440 1 C6B_C7B_AT_dist
 plot_distance $molid2 "type C6B and resname PGL" "type C7B and resname PGL" 0 2702 1 C6B_C7B_CG_dist
puts "\n\n"



####################################
##### Plots for LEG3 distances #####
####################################
#plot AT and CG distances C3A-GL2:
puts "C2A-GL2:"
 plot_distance $molid1 "(name $C3A) and resname PGL" "(name $GL2) and resname PGL" 1 5440 1 C3A_GL2_AT_dist
 plot_distance $molid2 "type C3A and resname PGL" "type GL2 and resname PGL" 0 2702 1 C3A_GL2_CG_dist
puts "\n\n"


#plot AT and CG distances GL2-C1C:
puts "GL2-C1C:"
 plot_distance $molid1 "(name  $GL2) and resname PGL" "(name $C1C) and resname PGL" 1 5440 1 GL2_C1C_AT_dist
 plot_distance $molid2 "type GL2 and resname PGL" "type C1C and resname PGL" 0 2702 1 GL2_C1C_CG_dist
puts "\n\n"


#plot AT and CG distances C1C-C2C:
puts "C1C-C2C:"
 plot_distance $molid1 "(name  $C1C) and resname PGL" "(name $C2C) and resname PGL" 1 5440 1 C1C_C2C_AT_dist
 plot_distance $molid2 "type C1C and resname PGL" "type C2C and resname PGL" 0 2702 1 C1C_C2C_CG_dist
puts "\n\n"


#plot AT and CG distances C2C-C3C:
puts "C2C-C3C:"
 plot_distance $molid1 "(name  $C2C) and resname PGL" "(name $C3C) and resname PGL" 1 5440 1 C2C_C3C_AT_dist
 plot_distance $molid2 "type C2C and resname PGL" "type C3C and resname PGL" 0 2702 1 C2C_C3C_CG_dist
puts "\n\n"


#plot AT and CG distances C3C-C4C:
puts "C3C-C4C:"
 plot_distance $molid1 "(name  $C3C) and resname PGL" "(name $C4C) and resname PGL" 1 5440 1 C3C_C4C_AT_dist
 plot_distance $molid2 "type C3C and resname PGL" "type C4C and resname PGL" 0 2702 1 C3C_C4C_CG_dist
puts "\n\n"


#plot AT and CG distances C4C-C5C:
puts "C4C-C5C:"
 plot_distance $molid1 "(name  $C4C) and resname PGL" "(name $C5C) and resname PGL" 1 5440 1 C4C_C5C_AT_dist
 plot_distance $molid2 "type C4C and resname PGL" "type C5C and resname PGL" 0 2702 1 C4C_C5C_CG_dist
puts "\n\n"


#plot AT and CG distances C5C-C6C:
puts "C5C-C6C:"
 plot_distance $molid1 "(name  $C5C) and resname PGL" "(name $C6C) and resname PGL" 1 5440 1 C5C_C6C_AT_dist
 plot_distance $molid2 "type C5C and resname PGL" "type C6C and resname PGL" 0 2702 1 C5C_C6C_CG_dist
puts "\n\n"


#plot AT and CG distances C6C-C7C:
puts "C6C-C7C:"
 plot_distance $molid1 "(name  $C6C) and resname PGL" "(name $C7C) and resname PGL" 1 5440 1 C6C_C7C_AT_dist
 plot_distance $molid2 "type C6C and resname PGL" "type C7C and resname PGL" 0 2702 1 C6C_C7C_CG_dist
puts "\n\n"






#################################
##### Plots for LEG1 angles #####
#################################
#Angle GB1-C1A-C2A
puts "Angle GB1-C1A-C2A"
 plot_angle $molid1 "(name  $GB1) and resname PGL" "(name $C1A) and resname PGL" "(name $C2A) and resname PGL" 1 5440 1 angle_GB1_C1A_C2A_AT
 plot_angle $molid2 "type GB1 and resname PGL" "type C1A and resname PGL" "type C2A and resname PGL" 0 2702 1 angle_GB1_C1A_C2A_CG
puts "\n\n"


#Angle C1A-C2A-C3A
puts "Angle C1A-C2A-C3A"
 plot_angle $molid1 "(name  $C1A) and resname PGL" "(name $C2A) and resname PGL" "(name $C3A) and resname PGL" 1 5440 1 angle_C1A_C2A_C3A_AT
 plot_angle $molid2 "type C1A and resname PGL" "type C2A and resname PGL" "type C3A and resname PGL" 0 2702 1 angle_C1A_C2A_C3A_CG
puts "\n\n"


#Angle C2A-C3A-C4A
puts "Angle C2A-C3A-C4A"
 plot_angle $molid1 "(name  $C2A) and resname PGL" "(name $C3A) and resname PGL" "(name $C4A) and resname PGL" 1 5440 1 angle_C2A_C3A_C4A_AT
 plot_angle $molid2 "type C2A and resname PGL" "type C3A and resname PGL" "type C4A and resname PGL" 0 2702 1 angle_C2A_C3A_C4A_CG
puts "\n\n"


#Angle C3A-C4A-C5A
puts "Angle C3A-C4A-C5A"
 plot_angle $molid1 "(name  $C3A) and resname PGL" "(name $C4A) and resname PGL" "(name $C5A) and resname PGL" 1 5440 1 angle_C3A_C4A_C5A_AT
 plot_angle $molid2 "type C3A and resname PGL" "type C4A and resname PGL" "type C5A and resname PGL" 0 2702 1 angle_C3A_C4A_C5A_CG
puts "\n\n"


#Angle C4A-C5A-C6A
puts "Angle C4A-C5A-C6A"
 plot_angle $molid1 "(name  $C4A) and resname PGL" "(name $C5A) and resname PGL" "(name $C6A) and resname PGL" 1 5440 1 angle_C4A_C5A_C6A_AT
 plot_angle $molid2 "type C4A and resname PGL" "type C5A and resname PGL" "type C6A and resname PGL" 0 2702 1 angle_C4A_C5A_C6A_CG
puts "\n\n"


#Angle C5A-C6A-C7A
puts "Angle C5A-C6A-C7A"
 plot_angle $molid1 "(name  $C5A) and resname PGL" "(name $C6A) and resname PGL" "(name $C7A) and resname PGL" 1 5440 1 angle_C5A_C6A_C7A_AT
 plot_angle $molid2 "type C5A and resname PGL" "type C6A and resname PGL" "type C7A and resname PGL" 0 2702 1 angle_C5A_C6A_C7A_CG
puts "\n\n"


##########################################
##### Plots for Sugar Phenyls angles #####
##########################################
#Angle C6A-C7A-SC41
puts "Angle C6A-C7A-SC41"
 plot_angle $molid1 "(name  $C6A) and resname PGL" "(name $C7A) and resname PGL" "(name $SC41) and resname PGL" 1 5440 1 angle_C6A_C7A_SC41_AT
 plot_angle $molid2 "type C6A and resname PGL" "type C7A and resname PGL" "type C9A and resname PGL" 0 2702 1 angle_C6A_C7A_SC41_CG
puts "\n\n"

#Angle C7A-SC41-SC42
puts "Angle C7A-SC41-SC42"
 plot_angle $molid1 "(name  $C7A) and resname PGL" "(name $SC41) and resname PGL" "(name $SC42) and resname PGL" 1 5440 1 angle_C7A_SC41_SC42_AT
 plot_angle $molid2 "type C7A and resname PGL" "type C9A and resname PGL" "type CXA and resname PGL" 0 2702 1 angle_C7A_SC41_SC42_CG
puts "\n\n"

#Angle C7A-SC41-SC43
puts "Angle C7A-SC41-SC43"
 plot_angle $molid1 "(name  $C7A) and resname PGL" "(name $SC41) and resname PGL" "(name $SC43) and resname PGL" 1 5440 1 angle_C7A_SC41_SC43_AT
 plot_angle $molid2 "type C7A and resname PGL" "type C9A and resname PGL" "type C8A and resname PGL" 0 2702 1 angle_C7A_SC41_SC43_CG
puts "\n\n"

#Angle SC42-SC41-SC43
puts "Angle SC42-SC41-SC43"
 plot_angle $molid1 "(name  $SC42) and resname PGL" "(name $SC41) and resname PGL" "(name $SC43) and resname PGL" 1 5440 1 angle_SC42_SC41_SC43_AT
 plot_angle $molid2 "type CXA and resname PGL" "type C9A and resname PGL" "type C8A and resname PGL" 0 2702 1 angle_SC42_SC41_SC43_CG
puts "\n\n"

#Angle SC41-SC43-SC42
puts "Angle SC41-SC43-SC42"
 plot_angle $molid1 "(name  $SC41) and resname PGL" "(name $SC43) and resname PGL" "(name $SC42) and resname PGL" 1 5440 1 angle_SC41_SC43_SC42_AT
 plot_angle $molid2 "type C9A and resname PGL" "type C8A and resname PGL" "type CXA and resname PGL" 0 2702 1 angle_SC41_SC43_SC42_CG
puts "\n\n"

#Angle SC43-SC42-SC41
puts "Angle SC43-SC42-SC41"
 plot_angle $molid1 "(name  $SC43) and resname PGL" "(name $SC42) and resname PGL" "(name $SC41) and resname PGL" 1 5440 1 angle_SC43_SC42_SC41_AT
 plot_angle $molid2 "type C8A and resname PGL" "type CXA and resname PGL" "type C9A and resname PGL" 0 2702 1 angle_SC43_SC42_SC41_CG
puts "\n\n"

#Angle SC41-SC42-B2
puts "Angle SC41-SC42-B2"
 plot_angle $molid1 "(name  $SC41) and resname PGL" "(name $SC42) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 angle_SC41_SC42_B2_AT
 plot_angle $molid2 "type C9A and resname PGL" "type CXA and resname PGL" "type B2 and resname PGL" 0 2702 1 angle_SC41_SC42_B2_CG
puts "\n\n"

#Angle SC43-SC42-B2
puts "Angle SC43-SC42-B2"
 plot_angle $molid1 "(name  $SC43) and resname PGL" "(name $SC42) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 angle_SC43_SC42_B2_AT
 plot_angle $molid2 "type C8A and resname PGL" "type CXA and resname PGL" "type B2 and resname PGL" 0 2702 1 angle_SC43_SC42_B2_CG
puts "\n\n"

#Angle SC42-B2-B1
puts "Angle SC42-B2-B1"
 plot_angle $molid1 "(name  $SC42) and resname PGL" "(name $B2) and resname PGL" "(name $B1) and resname PGL" 1 5440 1 angle_SC42_B2_B1_AT
 plot_angle $molid2 "type CXA and resname PGL" "type B2 and resname PGL" "type B1 and resname PGL" 0 2702 1 angle_SC42_B2_B1_CG
puts "\n\n"

#Angle SC42-B2-B3
puts "Angle SC42-B2-B3"
 plot_angle $molid1 "(name  $SC42) and resname PGL" "(name $B2) and resname PGL" "(name $B3) and resname PGL" 1 5440 1 angle_SC42_B2_B3_AT
 plot_angle $molid2 "type CXA and resname PGL" "type B2 and resname PGL" "type B3 and resname PGL" 0 2702 1 angle_SC42_B2_B3_CG
puts "\n\n"

#Angle B3-B2-B1
puts "Angle B3-B2-B1"
 plot_angle $molid1 "(name  $B3) and resname PGL" "(name $B2) and resname PGL" "(name $B1) and resname PGL" 1 5440 1 angle_B3_B2_B1_AT
 plot_angle $molid2 "type B3 and resname PGL" "type B2 and resname PGL" "type B1 and resname PGL" 0 2702 1 angle_B3_B2_B1_CG
puts "\n\n"



#################################
##### Plots for LEG2 angles #####
#################################
#Angle GL1-C1B-C2B
puts "Angle GL1-C1B-C2B"
 plot_angle $molid1 "(name  $GL1) and resname PGL" "(name $C1B) and resname PGL" "(name $C2B) and resname PGL" 1 5440 1 angle_GL1_C1B_C2B_AT
 plot_angle $molid2 "type GL1 and resname PGL" "type C1B and resname PGL" "type C2B and resname PGL" 0 2702 1 angle_GL1_C1B_C2B_CG
puts "\n\n"


#Angle C1B-C2B-C3B
puts "Angle C1B-C2B-C3B"
 plot_angle $molid1 "(name  $C1B) and resname PGL" "(name $C2B) and resname PGL" "(name $C3B) and resname PGL" 1 5440 1 angle_C1B_C2B_C3B_AT
 plot_angle $molid2 "type C1B and resname PGL" "type C2B and resname PGL" "type C3B and resname PGL" 0 2702 1 angle_C1B_C2B_C3B_CG
puts "\n\n"


#Angle C2B-C3B-C4B
puts "Angle C2B-C3B-C4B"
 plot_angle $molid1 "(name  $C2B) and resname PGL" "(name $C3B) and resname PGL" "(name $C4B) and resname PGL" 1 5440 1 angle_C2B_C3B_C4B_AT
 plot_angle $molid2 "type C2B and resname PGL" "type C3B and resname PGL" "type C4B and resname PGL" 0 2702 1 angle_C2B_C3B_C4B_CG
puts "\n\n"


#Angle C3B-C4B-C5B
puts "Angle C3B-C4B-C5B"
 plot_angle $molid1 "(name  $C3B) and resname PGL" "(name $C4B) and resname PGL" "(name $C5B) and resname PGL" 1 5440 1 angle_C3B_C4B_C5B_AT
 plot_angle $molid2 "type C3B and resname PGL" "type C4B and resname PGL" "type C5B and resname PGL" 0 2702 1 angle_C3B_C4B_C5B_CG
puts "\n\n"


#Angle C4B-C5B-C6B
puts "Angle C4B-C5B-C6B"
 plot_angle $molid1 "(name  $C4B) and resname PGL" "(name $C5B) and resname PGL" "(name $C6B) and resname PGL" 1 5440 1 angle_C4B_C5B_C6B_AT
 plot_angle $molid2 "type C4B and resname PGL" "type C5B and resname PGL" "type C6B and resname PGL" 0 2702 1 angle_C4B_C5B_C6B_CG
puts "\n\n"


#Angle C5B-C6B-C7B
puts "Angle C5B-C6B-C7B"
 plot_angle $molid1 "(name  $C5B) and resname PGL" "(name $C6B) and resname PGL" "(name $C7B) and resname PGL" 1 5440 1 angle_C5B_C6B_C7B_AT
 plot_angle $molid2 "type C5B and resname PGL" "type C6B and resname PGL" "type C7B and resname PGL" 0 2702 1 angle_C5B_C6B_C7B_CG
puts "\n\n"

#################################
##### Plots for LEG3 angles #####
#################################
#Angle GL2-C1C-C2C
puts "Angle GL2-C1C-C2C"
 plot_angle $molid1 "(name  $GL2) and resname PGL" "(name $C1C) and resname PGL" "(name $C2C) and resname PGL" 1 5440 1 angle_GL2_C1C_C2C_AT
 plot_angle $molid2 "type GL2 and resname PGL" "type C1C and resname PGL" "type C2C and resname PGL" 0 2702 1 angle_GL2_C1C_C2C_CG
puts "\n\n"


#Angle C1C-C2C-C3C
puts "Angle C1C-C2C-C3C"
 plot_angle $molid1 "(name  $C1C) and resname PGL" "(name $C2C) and resname PGL" "(name $C3C) and resname PGL" 1 5440 1 angle_C1C_C2C_C3C_AT
 plot_angle $molid2 "type C1C and resname PGL" "type C2C and resname PGL" "type C3C and resname PGL" 0 2702 1 angle_C1C_C2C_C3C_CG
puts "\n\n"


#Angle C2C-C3C-C4C
puts "Angle C2C-C3C-C4C"
 plot_angle $molid1 "(name  $C2C) and resname PGL" "(name $C3C) and resname PGL" "(name $C4C) and resname PGL" 1 5440 1 angle_C2C_C3C_C4C_AT
 plot_angle $molid2 "type C2C and resname PGL" "type C3C and resname PGL" "type C4C and resname PGL" 0 2702 1 angle_C2C_C3C_C4C_CG
puts "\n\n"


#Angle C3C-C4C-C5C
puts "Angle C3C-C4C-C5C"
 plot_angle $molid1 "(name  $C3C) and resname PGL" "(name $C4C) and resname PGL" "(name $C5C) and resname PGL" 1 5440 1 angle_C3C_C4C_C5C_AT
 plot_angle $molid2 "type C3C and resname PGL" "type C4C and resname PGL" "type C5C and resname PGL" 0 2702 1 angle_C3C_C4C_C5C_CG
puts "\n\n"


#Angle C4C-C5C-C6C
puts "Angle C4C-C5C-C6C"
 plot_angle $molid1 "(name  $C4C) and resname PGL" "(name $C5C) and resname PGL" "(name $C6C) and resname PGL" 1 5440 1 angle_C4C_C5C_C6C_AT
 plot_angle $molid2 "type C4C and resname PGL" "type C5C and resname PGL" "type C6C and resname PGL" 0 2702 1 angle_C4C_C5C_C6C_CG
puts "\n\n"


#Angle C5C-C6C-C7C
puts "Angle C5C-C6C-C7C"
 plot_angle $molid1 "(name  $C5C) and resname PGL" "(name $C6C) and resname PGL" "(name $C7C) and resname PGL" 1 5440 1 angle_C5C_C6C_C7C_AT
 plot_angle $molid2 "type C5C and resname PGL" "type C6C and resname PGL" "type C7C and resname PGL" 0 2702 1 angle_C5C_C6C_C7C_CG
puts "\n\n"





######################################
##### Plot for LEG1 TOTAL LENGTH #####
######################################
#plot AT and CG distances GB1-B2: 
puts "GB1-B2:"
 plot_distance $molid1 "(name $GB1) and resname PGL" "(name $B2) and resname PGL" 1 5440 1 GB1_B2_AT_dist
 plot_distance $molid2 "type GB1 and resname PGL" "type B2 and resname PGL" 0 2702 1 GB1_B2_CG_dist
puts "\n\n"

######################################
##### Plot for LEG1 TOTAL ANGLE ######
######################################

######################################
##### Plot for LEG2 TOTAL LENGTH #####
######################################
#plot AT and CG distances GL1-C7B:
puts "GL1-C7B:"
 plot_distance $molid1 "(name $GL1) and resname PGL" "(name $C7B) and resname PGL" 1 5440 1 GL1_C7B_AT_dist
 plot_distance $molid2 "type GL1 and resname PGL" "type C7B and resname PGL" 0 2702 1 GL1_C7B_CG_dist
puts "\n\n"

######################################
##### Plot for LEG2 TOTAL ANGLE ######
######################################

######################################
##### Plot for LEG3 TOTAL LENGTH #####
######################################
#plot AT and CG distances GL2-C7C:
puts "GL2-C7C:"
 plot_distance $molid1 "(name $GL2) and resname PGL" "(name $C7C) and resname PGL" 1 5440 1 GL2_C7C_AT_dist
 plot_distance $molid2 "type GL2 and resname PGL" "type C7C and resname PGL" 0 2702 1 GL2_C7C_CG_dist
puts "\n\n"

######################################
##### Plot for LEG3 TOTAL ANGLE ######
######################################



###########################################
##### Plot for leg 2 attachment angle #####
###########################################
#Angle C3A-GL1-C1B
puts "Angle C3A-GL1-C1B"
 plot_angle $molid1 "(name  $C3A) and resname PGL" "(name $GL1) and resname PGL" "(name $C1B) and resname PGL" 1 5440 1 angle_C3A_GL1_C1B_AT
 plot_angle $molid2 "type C3A and resname PGL" "type GL1 and resname PGL" "type C1B and resname PGL" 0 2702 1 angle_C3A_GL1_C1B_CG
puts "\n\n"

#Angle C2A-C3A-GL1
puts "Angle C2A-C3A-GL1"
 plot_angle $molid1 "(name  $C2A) and resname PGL" "(name $C3A) and resname PGL" "(name $GL1) and resname PGL" 1 5440 1 angle_C2A_C3A_GL1_AT
 plot_angle $molid2 "type C2A and resname PGL" "type C3A and resname PGL" "type GL1 and resname PGL" 0 2702 1 angle_C2A_C3A_GL1_CG
puts "\n\n"

#Angle C4A-C3A-GL1
puts "Angle C4A-C3A-GL1"
 plot_angle $molid1 "(name  $C4A) and resname PGL" "(name $C3A) and resname PGL" "(name $GL1) and resname PGL" 1 5440 1 angle_C4A_C3A_GL1_AT
 plot_angle $molid2 "type C4A and resname PGL" "type C3A and resname PGL" "type GL1 and resname PGL" 0 2702 1 angle_C4A_C3A_GL1_CG
puts "\n\n"

###########################################
##### Plot for leg 3 attachment angle #####
###########################################
#Angle C3A-GL2-C1C
puts "Angle C3A-GL2-C1C"
 plot_angle $molid1 "(name  $C3A) and resname PGL" "(name $GL2) and resname PGL" "(name $C1C) and resname PGL" 1 5440 1 angle_C3A_GL2_C1C_AT
 plot_angle $molid2 "type C3A and resname PGL" "type GL2 and resname PGL" "type C1C and resname PGL" 0 2702 1 angle_C3A_GL2_C1C_CG
puts "\n\n"

#Angle C2A-C3A-GL2
puts "Angle C2A-C3A-GL2"
 plot_angle $molid1 "(name  $C2A) and resname PGL" "(name $C3A) and resname PGL" "(name $GL2) and resname PGL" 1 5440 1 angle_C2A_C3A_GL2_AT
 plot_angle $molid2 "type C2A and resname PGL" "type C3A and resname PGL" "type GL2 and resname PGL" 0 2702 1 angle_C2A_C3A_GL2_CG
puts "\n\n"

#Angle C4A-C3A-GL2
puts "Angle C4A-C3A-GL2"
 plot_angle $molid1 "(name  $C4A) and resname PGL" "(name $C3A) and resname PGL" "(name $GL2) and resname PGL" 1 5440 1 angle_C4A_C3A_GL2_AT
 plot_angle $molid2 "type C4A and resname PGL" "type C3A and resname PGL" "type GL2 and resname PGL" 0 2702 1 angle_C4A_C3A_GL2_CG
puts "\n\n"



###############################################
##### Plot for leg 2 & 3 attachment angle #####
###############################################
#Angle GL1-C3A-GL2
puts "Angle GL1-C3A-GL2"
 plot_angle $molid1 "(name  $GL1) and resname PGL" "(name $C3A) and resname PGL" "(name $GL2) and resname PGL" 1 5440 1 angle_GL1_C3A_GL2_AT
 plot_angle $molid2 "type GL1 and resname PGL" "type C3A and resname PGL" "type GL2 and resname PGL" 0 2702 1 angle_GL1_C3A_GL2_CG
puts "\n\n"
