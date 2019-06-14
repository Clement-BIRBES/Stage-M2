set molid1 [mol new {/home/birbes/Documents/PhaseHexa/4_layers.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]


set nb_lipid_per_mb 24
set counter 0




set minx [lindex [lindex [measure minmax [atomselect top "type PO4"]] 0] 0]
set maxx [lindex [lindex [measure minmax [atomselect top "type PO4"]] 1] 0]
set miny [lindex [lindex [measure minmax [atomselect top "type PO4"]] 0] 1]
set maxy [lindex [lindex [measure minmax [atomselect top "type PO4"]] 1] 1]

set y_end 2

set half_lip [expr $nb_lipid_per_mb/$y_end]

set x_end $half_lip


set dx [expr ($maxx-$minx)/($x_end*1.0)]
set dy [expr ($maxy-$miny)/($y_end*1.0)]

for {set z 0} {$z < 4} {incr z 1} {
	if {$z == 0} {
		#mb4
		set zmin 173
		set zmax 215
	}
	if {$z == 1} {
		#mb3
		set zmin 119
		set zmax 160
	}
	if {$z == 2} {
		#mb2
		set zmin 64
		set zmax 104
	}
	if {$z == 3} {
		#mb1
		set zmin 0
		set zmax 52
	}
	for {set x 0} { $x < $x_end} { incr x 4 } {
		for {set y 0} { $y < $y_end} { incr y 1 } {
	
			set molid [mol new {/home/birbes/Documents/Scripts/PGLFinal.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]
			set DIM [atomselect $molid "all"]	
			set xmin [expr $minx + $x*$dx]		
			set xmax [expr $minx + ($x+1)*$dx]		
			set ymin [expr $miny + $y*$dy]		
			set ymax [expr $miny + ($y+1)*$dy]
	
			set matrix1 [transvec "0 0 1"]
	
			if {$counter%2==0} {	
				set matrix1 [transvec "0 0 -1"]		
			}
			
			set lipid_patch [atomselect 0 "resname DOPE POPC and (z < $zmax and z > $zmin) and (x < $xmax and x > $xmin) and (y < $ymax and y > $ymin) "]
	
			set center_patch [measure center $lipid_patch]
	
	
			set matrix2 [transoffset $center_patch]
	
			$DIM move $matrix1
			$DIM move $matrix2
			$DIM writepdb "DIM_$counter.pdb"
			incr counter
			$DIM delete
			$lipid_patch delete
	
		}
		puts "$counter"	
	
	}
}


