source /data/DIM/script/plot_N0.tcl

#calculate the bond distances for AT and CG:
#set molid1 0
#set molid2 1

set molid1 [mol new {/data/DIM/AT/start.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]
mol addfile {/data/DIM/AT/traj_center.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid1

set molid2 [mol new {run_dim_popc.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {run_dim_popc_center.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid2

set GB1 "O5 C94 C95 C96" 
set C1A "C90 C91 C92 C93" 
set C2A "C1 C2 C3 C89 C90" 
set C3A "C1 C58 C59 C62 C63"
set C4A "C63 C64 C65 C66 C67"
set C5A "C67 C68 C69 C70 C71"
set C6A "C71 C72 C73 C74 C75"  
set C7A "C75 C76 C77 C78 C79"

set GL1 "O2 O3 C3 C4" 
set C1B "C4  C5  C6  C7"  
set C2B "C7  C8  C9  C10 C11"
set C3B "C11 C12 C13 C14 C15"
set C4B "C15 C16 C17 C18 C19"
set C5B "C19 C20 C21 C22 C23" 
set C6B "C23 C24 C25 C26 C27"
set C7B "C27 C28 C29 C30 C61"

set GL2 "O1 O4 C1 C31" 
set C1C "C31 C32 C33 C34"
set C2C "C34 C35 C36 C37 C38"
set C3C "C38 C39 C40 C41 C42"
set C4C "C42 C43 C44 C45 C46"
set C5C "C46 C47 C48 C49 C50"
set C6C "C50 C51 C52 C53 C54"
set C7C "C54 C55 C56 C57 C60"



#plot AT and CG distances GB1-C1A:
puts "GB1-C1A:"
 plot_distance $molid1 "(name $GB1) and resname DIM" "(name $C1A) and resname DIM" 1 6440 1 GB1_C1A_AT_dist
 plot_distance $molid2 "type GB1 and resname DIM" "type C1A and resname DIM" 0 3000 1 GB1_C1A_CG_dist
puts "\n\n"

#plot AT and CG distances C1A-C2A:
puts "C1A-C2A:"
 plot_distance $molid1 "(name $C1A) and resname DIM" "(name $C2A) and resname DIM" 1 6440 1 C1A_C2A_AT_dist
 plot_distance $molid2 "type C2A and resname DIM" "type C1A and resname DIM" 0 3000 1 C1A_C2A_CG_dist
puts "\n\n"


#plot AT and CG distances C2A-C3A:
puts "C2A-C3A:"
 plot_distance $molid1 "(name $C2A) and resname DIM" "(name $C3A) and resname DIM" 1 6440 1 C2A_C3A_AT_dist
 plot_distance $molid2 "type C3A and resname DIM" "type C2A and resname DIM" 0 3000 1 C2A_C3A_CG_dist
puts "\n\n"


#plot AT and CG distances C3A-C4A:
puts "C3A-C4A:"
 plot_distance 0 "(name $C3A) and resname DIM" "(name $C4A) and resname DIM" 1 6440 1 C3A_C4A_AT_dist
 plot_distance 1 "type C3A and resname DIM" "type C4A and resname DIM" 0 3000 1 C3A_C4A_CG_dist
puts "\n\n"

#plot AT and CG distances C4A-C5A:
puts "C4A-C5A:"
 plot_distance $molid1 "(name $C4A) and resname DIM" "(name $C5A) and resname DIM" 1 6440 1 C4A_C5A_AT_dist
 plot_distance $molid2 "type C5A and resname DIM" "type C4A and resname DIM" 0 3000 1 C4A_C5A_CG_dist
puts "\n\n"


#plot AT and CG distances C5A-C6A:
puts "C5A-C6A:"
 plot_distance $molid1 "(name $C5A) and resname DIM" "(name $C6A) and resname DIM" 1 6440 1 C5A_C6A_AT_dist
 plot_distance $molid2 "type C5A and resname DIM" "type C6A and resname DIM" 0 3000 1 C5A_C6A_CG_dist
puts "\n\n"


#plot AT and CG distances C6A-C7A: 
puts "C6A-C7A:"
 plot_distance $molid1 "(name $C6A) and resname DIM" "(name $C7A) and resname DIM" 1 6440 1 C6A_C7A_AT_dist
 plot_distance $molid2 "type C6A and resname DIM" "type C7A and resname DIM" 0 3000 1 C6A_C7A_CG_dist
puts "\n\n"


#plot AT and CG distances GB1-C7A: 
puts "GB1-C7A:"
 plot_distance $molid1 "(name $GB1) and resname DIM" "(name $C7A) and resname DIM" 1 6440 1 GB1_C7A_AT_dist
 plot_distance $molid2 "type GB1 and resname DIM" "type C7A and resname DIM" 0 3000 1 GB1_C7A_CG_dist
puts "\n\n"


#plot AT and CG distances C2A-GL1:
puts "C2A-GL1:"
 plot_distance $molid1 "(name $C2A) and resname DIM" "(name $GL1) and resname DIM" 1 6440 1 C2A_GL1_AT_dist
 plot_distance $molid2 "type C2A and resname DIM" "type GL1 and resname DIM" 0 3000 1 C2A_GL1_CG_dist
puts "\n\n"


#plot AT and CG distances GL1-C1B:
puts "GL1-C1B:"
 plot_distance $molid1 "(name  $GL1) and resname DIM" "(name $C1B) and resname DIM" 1 6440 1 GL1_C1B_AT_dist
 plot_distance $molid2 "type C1B and resname DIM" "type GL1 and resname DIM" 0 3000 1 GL1_C1B_CG_dist
puts "\n\n"


#plot AT and CG distances C1B-C2B:
puts "C1B-C2B:"
 plot_distance $molid1 "(name  $C1B) and resname DIM" "(name $C2B) and resname DIM" 1 6440 1 C1B_C2B_AT_dist
 plot_distance $molid2 "type C1B and resname DIM" "type C2B and resname DIM" 0 3000 1 C1B_C2B_CG_dist
puts "\n\n"


#plot AT and CG distances C2B-C3B:
puts "C2B-C3B:"
 plot_distance $molid1 "(name  $C2B) and resname DIM" "(name $C3B) and resname DIM" 1 6440 1 C2B_C3B_AT_dist
 plot_distance $molid2 "type C2B and resname DIM" "type C3B and resname DIM" 0 3000 1 C2B_C3B_CG_dist
puts "\n\n"


#plot AT and CG distances C3B-C4B:
puts "C3B-C4B:"
  plot_distance $molid1 "(name  $C3B) and resname DIM" "(name $C4B) and resname DIM" 1 6440 1 C3B_C4B_AT_dist
  plot_distance $molid2 "type C3B and resname DIM" "type C4B and resname DIM" 0 3000 1 C3B_C4B_CG_dist
puts "\n\n"


#plot AT and CG distances C4B-C5B:
puts "C4B-C5B:"
  plot_distance $molid1 "(name  $C4B) and resname DIM" "(name $C5B) and resname DIM" 1 6440 1 C4B_C5B_AT_dist
  plot_distance $molid2 "type C4B and resname DIM" "type C5B and resname DIM" 0 3000 1 C4B_C5B_CG_dist
puts "\n\n"


#plot AT and CG distances C5B-C6B:
puts "C5B-C6B:"
  plot_distance $molid1 "(name $C5B) and resname DIM" "(name $C6B) and resname DIM" 1 6440 1 C5B_C6B_AT_dist
  plot_distance $molid2 "type C5B and resname DIM" "type C6B and resname DIM" 0 3000 1 C5B_C6B_CG_dist
puts "\n\n"


#plot AT and CG distances C6B-C7B:
puts "C6B-C7B:"
  plot_distance $molid1 "(name $C6B) and resname DIM" "(name $C7B) and resname DIM" 1 6440 1 C6B_C7B_AT_dist
  plot_distance $molid2 "type C6B and resname DIM" "type C7B and resname DIM" 0 3000 1 C6B_C7B_CG_dist
puts "\n\n"


#plot AT and CG distances GL1-C7B:
puts "GL1-C7B:"
  plot_distance $molid1 "(name $GL1) and resname DIM" "(name $C7B) and resname DIM" 1 6440 1 GL1_C7B_AT_dist
  plot_distance $molid2 "type GL1 and resname DIM" "type C7B and resname DIM" 0 3000 1 GL1_C7B_CG_dist
puts "\n\n"


#plot AT and CG distances C2A-GL2:
puts "C2A-GL2:"
  plot_distance $molid1 "(name $C2A) and resname DIM" "(name $GL2) and resname DIM" 1 6440 1 C2A_GL2_AT_dist
  plot_distance $molid2 "type C2A and resname DIM" "type GL2 and resname DIM" 0 3000 1 C2A_GL2_CG_dist
puts "\n\n"


#plot AT and CG distances GL2-C1C:
puts "GL2-C1C:"
  plot_distance $molid1 "(name  $GL2) and resname DIM" "(name $C1C) and resname DIM" 1 6440 1 GL2_C1C_AT_dist
  plot_distance $molid2 "type GL2 and resname DIM" "type C1C and resname DIM" 0 3000 1 GL2_C1C_CG_dist
puts "\n\n"


#plot AT and CG distances C1C-C2C:
puts "C1C-C2C:"
  plot_distance $molid1 "(name  $C1C) and resname DIM" "(name $C2C) and resname DIM" 1 6440 1 C1C_C2C_AT_dist
  plot_distance $molid2 "type C1C and resname DIM" "type C2C and resname DIM" 0 3000 1 C1C_C2C_CG_dist
puts "\n\n"


#plot AT and CG distances C2C-C3C:
puts "C2C-C3C:"
  plot_distance $molid1 "(name  $C2C) and resname DIM" "(name $C3C) and resname DIM" 1 6440 1 C2C_C3C_AT_dist
  plot_distance $molid2 "type C2C and resname DIM" "type C3C and resname DIM" 0 3000 1 C2C_C3C_CG_dist
puts "\n\n"


#plot AT and CG distances C3C-C4C:
puts "C3C-C4C:"
  plot_distance $molid1 "(name  $C3C) and resname DIM" "(name $C4C) and resname DIM" 1 6440 1 C3C_C4C_AT_dist
  plot_distance $molid2 "type C3C and resname DIM" "type C4C and resname DIM" 0 3000 1 C3C_C4C_CG_dist
puts "\n\n"


#plot AT and CG distances C4C-C5C:
puts "C4C-C5C:"
  plot_distance $molid1 "(name  $C4C) and resname DIM" "(name $C5C) and resname DIM" 1 6440 1 C4C_C5C_AT_dist
  plot_distance $molid2 "type C4C and resname DIM" "type C5C and resname DIM" 0 3000 1 C4C_C5C_CG_dist
puts "\n\n"


#plot AT and CG distances C5C-C6C:
puts "C5C-C6C:"
  plot_distance $molid1 "(name  $C5C) and resname DIM" "(name $C6C) and resname DIM" 1 6440 1 C5C_C6C_AT_dist
  plot_distance $molid2 "type C5C and resname DIM" "type C6C and resname DIM" 0 3000 1 C5C_C6C_CG_dist
puts "\n\n"


#plot AT and CG distances C6C-C7C:
puts "C6C-C7C:"
  plot_distance $molid1 "(name  $C6C) and resname DIM" "(name $C7C) and resname DIM" 1 6440 1 C6C_C7C_AT_dist
  plot_distance $molid2 "type C6C and resname DIM" "type C7C and resname DIM" 0 3000 1 C6C_C7C_CG_dist
puts "\n\n"




#Angle GB1-C1A-C2A
puts "Angle GB1-C1A-C2A"
  plot_angle $molid1 "(name  $GB1) and resname DIM" "(name $C1A) and resname DIM" "(name $C2A) and resname DIM" 1 6440 1 angle_GB1_C1A_C2A_AT
plot_angle $molid2 "type GB1 and resname DIM" "type C1A and resname DIM" "type C2A and resname DIM" 0 3000 1 angle_GB1_C1A_C2A_CG
puts "\n\n"


#Angle C1A-C2A-C3A
puts "Angle C1A-C2A-C3A"
  plot_angle $molid1 "(name  $C1A) and resname DIM" "(name $C2A) and resname DIM" "(name $C3A) and resname DIM" 1 6440 1 angle_C1A_C2A_C3A_AT
plot_angle $molid2 "type C1A and resname DIM" "type C2A and resname DIM" "type C3A and resname DIM" 0 3000 1 angle_C1A_C2A_C3A_CG
puts "\n\n"


#Angle C2A-C3A-C4A
puts "Angle C2A-C3A-C4A"
  plot_angle $molid1 "(name  $C2A) and resname DIM" "(name $C3A) and resname DIM" "(name $C4A) and resname DIM" 1 6440 1 angle_C2A_C3A_C4A_AT
plot_angle $molid2 "type C2A and resname DIM" "type C3A and resname DIM" "type C4A and resname DIM" 0 3000 1 angle_C2A_C3A_C4A_CG
puts "\n\n"


#Angle C3A-C4A-C5A
puts "Angle C3A-C4A-C5A"
  plot_angle $molid1 "(name  $C3A) and resname DIM" "(name $C4A) and resname DIM" "(name $C5A) and resname DIM" 1 6440 1 angle_C3A_C4A_C5A_AT
plot_angle $molid2 "type C3A and resname DIM" "type C4A and resname DIM" "type C5A and resname DIM" 0 3000 1 angle_C3A_C4A_C5A_CG
puts "\n\n"


#Angle C4A-C5A-C6A
puts "Angle C4A-C5A-C6A"
  plot_angle $molid1 "(name  $C4A) and resname DIM" "(name $C5A) and resname DIM" "(name $C6A) and resname DIM" 1 6440 1 angle_C4A_C5A_C6A_AT
plot_angle $molid2 "type C4A and resname DIM" "type C5A and resname DIM" "type C6A and resname DIM" 0 3000 1 angle_C4A_C5A_C6A_CG
puts "\n\n"


#Angle C5A-C6A-C7A
puts "Angle C5A-C6A-C7A"
  plot_angle $molid1 "(name  $C5A) and resname DIM" "(name $C6A) and resname DIM" "(name $C7A) and resname DIM" 1 6440 1 angle_C5A_C6A_C7A_AT
plot_angle $molid2 "type C5A and resname DIM" "type C6A and resname DIM" "type C7A and resname DIM" 0 3000 1 angle_C5A_C6A_C7A_CG
puts "\n\n"


#Angle GL1-C1B-C2B
puts "Angle GL1-C1B-C2B"
  plot_angle $molid1 "(name  $GL1) and resname DIM" "(name $C1B) and resname DIM" "(name $C2B) and resname DIM" 1 6440 1 angle_GL1_C1B_C2B_AT
plot_angle $molid2 "type GL1 and resname DIM" "type C1B and resname DIM" "type C2B and resname DIM" 0 3000 1 angle_GL1_C1B_C2B_CG
puts "\n\n"


#Angle C1B-C2B-C3B
puts "Angle C1B-C2B-C3B"
  plot_angle $molid1 "(name  $C1B) and resname DIM" "(name $C2B) and resname DIM" "(name $C3B) and resname DIM" 1 6440 1 angle_C1B_C2B_C3B_AT
plot_angle $molid2 "type C1B and resname DIM" "type C2B and resname DIM" "type C3B and resname DIM" 0 3000 1 angle_C1B_C2B_C3B_CG
puts "\n\n"


#Angle C2B-C3B-C4B
puts "Angle C2B-C3B-C4B"
  plot_angle $molid1 "(name  $C2B) and resname DIM" "(name $C3B) and resname DIM" "(name $C4B) and resname DIM" 1 6440 1 angle_C2B_C3B_C4B_AT
plot_angle $molid2 "type C2B and resname DIM" "type C3B and resname DIM" "type C4B and resname DIM" 0 3000 1 angle_C2B_C3B_C4B_CG
puts "\n\n"


#Angle C3B-C4B-C5B
puts "Angle C3B-C4B-C5B"
  plot_angle $molid1 "(name  $C3B) and resname DIM" "(name $C4B) and resname DIM" "(name $C5B) and resname DIM" 1 6440 1 angle_C3B_C4B_C5B_AT
plot_angle $molid2 "type C3B and resname DIM" "type C4B and resname DIM" "type C5B and resname DIM" 0 3000 1 angle_C3B_C4B_C5B_CG
puts "\n\n"


#Angle C4B-C5B-C6B
puts "Angle C4B-C5B-C6B"
  plot_angle $molid1 "(name  $C4B) and resname DIM" "(name $C5B) and resname DIM" "(name $C6B) and resname DIM" 1 6440 1 angle_C4B_C5B_C6B_AT
plot_angle $molid2 "type C4B and resname DIM" "type C5B and resname DIM" "type C6B and resname DIM" 0 3000 1 angle_C4B_C5B_C6B_CG
puts "\n\n"


#Angle C5B-C6B-C7B
puts "Angle C5B-C6B-C7B"
  plot_angle $molid1 "(name  $C5B) and resname DIM" "(name $C6B) and resname DIM" "(name $C7B) and resname DIM" 1 6440 1 angle_C5B_C6B_C7B_AT
plot_angle $molid2 "type C5B and resname DIM" "type C6B and resname DIM" "type C7B and resname DIM" 0 3000 1 angle_C5B_C6B_C7B_CG
puts "\n\n"


#Angle GL2-C1C-C2C
puts "Angle GL2-C1C-C2C"
  plot_angle $molid1 "(name  $GL2) and resname DIM" "(name $C1C) and resname DIM" "(name $C2C) and resname DIM" 1 6440 1 angle_GL2_C1C_C2C_AT
plot_angle $molid2 "type GL2 and resname DIM" "type C1C and resname DIM" "type C2C and resname DIM" 0 3000 1 angle_GL2_C1C_C2C_CG
puts "\n\n"


#Angle C1C-C2C-C3C
puts "Angle C1C-C2C-C3C"
  plot_angle $molid1 "(name  $C1C) and resname DIM" "(name $C2C) and resname DIM" "(name $C3C) and resname DIM" 1 6440 1 angle_C1C_C2C_C3C_AT
plot_angle $molid2 "type C1C and resname DIM" "type C2C and resname DIM" "type C3C and resname DIM" 0 3000 1 angle_C1C_C2C_C3C_CG
puts "\n\n"


#Angle C2C-C3C-C4C
puts "Angle C2C-C3C-C4C"
  plot_angle $molid1 "(name  $C2C) and resname DIM" "(name $C3C) and resname DIM" "(name $C4C) and resname DIM" 1 6440 1 angle_C2C_C3C_C4C_AT
plot_angle $molid2 "type C2C and resname DIM" "type C3C and resname DIM" "type C4C and resname DIM" 0 3000 1 angle_C2C_C3C_C4C_CG
puts "\n\n"


#Angle C3C-C4C-C5C
puts "Angle C3C-C4C-C5C"
  plot_angle $molid1 "(name  $C3C) and resname DIM" "(name $C4C) and resname DIM" "(name $C5C) and resname DIM" 1 6440 1 angle_C3C_C4C_C5C_AT
plot_angle $molid2 "type C3C and resname DIM" "type C4C and resname DIM" "type C5C and resname DIM" 0 3000 1 angle_C3C_C4C_C5C_CG
puts "\n\n"


#Angle C4C-C5C-C6C
puts "Angle C4C-C5C-C6C"
  plot_angle $molid1 "(name  $C4C) and resname DIM" "(name $C5C) and resname DIM" "(name $C6C) and resname DIM" 1 6440 1 angle_C4C_C5C_C6C_AT
plot_angle $molid2 "type C4C and resname DIM" "type C5C and resname DIM" "type C6C and resname DIM" 0 3000 1 angle_C4C_C5C_C6C_CG
puts "\n\n"


#Angle C5C-C6C-C7C
puts "Angle C5C-C6C-C7C"
  plot_angle $molid1 "(name  $C5C) and resname DIM" "(name $C6C) and resname DIM" "(name $C7C) and resname DIM" 1 6440 1 angle_C5C_C6C_C7C_AT
plot_angle $molid2 "type C5C and resname DIM" "type C6C and resname DIM" "type C7C and resname DIM" 0 3000 1 angle_C5C_C6C_C7C_CG
puts "\n\n"


#Angle C2A-GL1-C1B
puts "Angle C2A-GL1-C1B"
  plot_angle $molid1 "(name  $C2A) and resname DIM" "(name $GL1) and resname DIM" "(name $C1B) and resname DIM" 1 6440 1 angle_C2A_GL1_C1B_AT
plot_angle $molid2 "type C2A and resname DIM" "type GL1 and resname DIM" "type C1B and resname DIM" 0 3000 1 angle_C2A_GL1_C1B_CG
puts "\n\n"


#Angle C2A-GL2-C1C
puts "Angle C2A-GL2-C1C"
  plot_angle $molid1 "(name  $C2A) and resname DIM" "(name $GL2) and resname DIM" "(name $C1C) and resname DIM" 1 6440 1 angle_C2A_GL2_C1C_AT
plot_angle $molid2 "type C2A and resname DIM" "type GL2 and resname DIM" "type C1C and resname DIM" 0 3000 1 angle_C2A_GL2_C1C_CG
puts "\n\n"


#Angle GL1-C2A-GL2
puts "Angle GL1-C2A-GL2"
  plot_angle $molid1 "(name  $GL1) and resname DIM" "(name $C2A) and resname DIM" "(name $GL2) and resname DIM" 1 6440 1 angle_GL1_C2A_GL2_AT
plot_angle $molid2 "type GL1 and resname DIM" "type C2A and resname DIM" "type GL2 and resname DIM" 0 3000 1 angle_GL1_C2A_GL2_CG
puts "\n\n"



