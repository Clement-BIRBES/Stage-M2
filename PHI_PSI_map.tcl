#selection part
mol load parm7 sysNoWater.prmtop 
mol addfile Simu1us/TrajectoireFinale1usNoWater.xtc type {xtc} first 0 last -1 step 1 waitfor all

puts "Dcd files loaded"
set nf [molinfo top get numframes]
puts "nf = $nf"
set outfile [open AnglesDihedLiaisonPhenylSucre.csv w]


for { set i 1} { $i <= $nf} { incr i} {
  set O5 [atomselect top "resname PGL and name O6"]
  set O5_num [$O5 get index ]
  set O5_num_fin [expr $O5_num]
  set C1 [atomselect top "resname PGL and name C98"]
  set C1_num [$C1 get index ]
  set C1_num_fin [expr $C1_num]
  set O4 [atomselect top "resname PGL and name O999"]
  set O4_num [$O4 get index ]
  set O4_num_fin [expr $O4_num]
  set C4 [atomselect top "resname PGL and name C96"]
  set C4_num [$C4 get index ]
  set C4_num_fin [expr $C4_num]
  set C3 [atomselect top "resname PGL and name C97"]
  set C3_num [$C3 get index ]
  set C3_num_fin [expr $C3_num]
  set C94 [atomselect top "resname PGL and name C94"]
  set C94_num [$C94 get index ]
  set C94_num_fin [expr $C94_num]
  set C99 [atomselect top "resname PGL and name C99"]
  set C99_num [$C99 get index ]
  set C99_num_fin [expr $C99_num]
  
# $O5 frame $i
# $C1 frame $i
# $O4 frame $i
# $C4 frame $i
# $C3 frame $i
# puts "$O5_num_fin $C1_num_fin $O4_num_fin $C4_num_fin"
# puts "$C1_num_fin $O4_num_fin $C4_num_fin $C3_num_fin"
  set PHI [measure dihed "$O5_num_fin $C1_num_fin $O4_num_fin $C4_num_fin" frame $i]
# puts "Dihedral PHI = $PHI"
  set PSI [measure dihed "$C1_num_fin $O4_num_fin $C4_num_fin $C3_num_fin" frame $i]
  set PHI2 [measure dihed "$C99_num_fin $C1_num_fin $O4_num_fin $C4_num_fin" frame $i]
# puts "Dihedral PHI = $PHI"
  set PSI2 [measure dihed "$C1_num_fin $O4_num_fin $C4_num_fin $C94_num_fin" frame $i]
# puts "Dihedral PSI = $PSI"
# puts " SUMPHI = $sumPHI  SUMPSI = $sumPSI"
  puts $outfile "$i,$PHI,$PSI,$PHI2,$PSI2"
  }
close $outfile
