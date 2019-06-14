# M. Chavent August 2017
# simple tcl script to plot 
# create an RMSD matrix 


# create the ouput files to use for the python script
proc create_file {filename list1 list2} {

    set data_file [open $filename w]    
    set list_length [llength $list1]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
		set A [lindex $list1 $i]
		set B [lindex $list2 $i]		

  		puts $data_file "$A\t$B"	
  	}
  	 	close $data_file
}


# create the ouput files to use for the python script
proc create_file2 {filename list1} {

    set data_file [open $filename w]    
    set list_length [llength $list1]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
		set A [lindex $list1 $i]		

  		puts $data_file "$A"	
  	}
  	 	close $data_file
}

proc create_file3 {filename list1 list2} {

    set data_file [open $filename w]    
    set list_length [llength $list1]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
		set A [lindex $list1 $i]
		set B [lindex $list2 $i]		

  		puts $data_file "$A\t$B"	
  	}
  	 	close $data_file
}

# create the ouput files to use for the python script
proc create_file3 {filename list1 list2} {

    set data_file [open $filename w]    
    set list_length [llength $list1]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
		set A [lindex $list1 $i]		

  		puts $data_file "$A"	
  	}
  	 	close $data_file
}


# calculation of angle between 3 points
proc angle {D H A} {
 # cosine of the angle between three points
 # get Pi
 global M_PI

 # setup vectors hd and ha
 set hd [vecsub $D $H]
 set ha [vecsub $A $H]
 set cosine [expr [vecdot $hd $ha] / ( [veclength $hd] * [veclength $ha])]

 # convert cosine to angle in degrees
 return [expr acos($cosine)*(180.0/$M_PI)]
} 




proc inter {molid sel1 sel2 f_start f_end dt cutoff output_file} {

	set list_global ""
	set list_res [lsort -integer -unique [[atomselect top $sel2] get resid]]

	foreach resid $list_res {

		set nb_inter_list ""
		for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
			set selec [atomselect $molid "resid $resid and within $cutoff of $sel1" frame $f1]
			set nb [$selec num]
			if {$nb > 10} {set nb 10}

			$selec delete
	 		lappend nb_inter_list $nb
			puts $f1
		}
		lappend list_global $nb_inter_list

	}
		create_file $output_file $list_res $list_global 
		exec python /data/DIM/script/matrix_lipids.py $output_file "inter_chol"
}

proc plot_z {molid sel f_start f_end dt output_file} {

	set list_z ""
	set list_frame ""
	
	for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
		set selec [atomselect $molid $sel frame $f1]
		set center [measure center $selec]
		set z [lindex $center 2]

		$selec delete
		
	 	lappend list_z $z
		lappend list_frame $f1
		puts $f1
	}

	create_file $output_file $list_frame $list_z
	#exec python /home/chavent/CR3/scripts/matrix_RMSD.py "RMSD_matrix.txt" "frame1.txt" "frame2.txt" $output_name
}


proc plot_all_z_chol {molid sel f_start f_end dt} {

	set list_res [lsort -integer -unique [[atomselect top $sel] get resid]]

	foreach resid $list_res {
		set filename "CHL$resid.dat"
		plot_z $molid "resid $resid" $f_start $f_end $dt $filename
	}

}


proc plot_distance {molid sel1 sel2 f_start f_end dt output_file} {
	for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
		set selec1 [atomselect $molid $sel1 frame $f1]
		set selec2 [atomselect $molid $sel2 frame $f1]

		set center1 [measure center $selec1]
		set center2 [measure center $selec2]

		set distance [vecdist $center1 $center2]	

		$selec1 delete
		$selec2 delete
		
		if {$distance < 50 } { 
			lappend list_dist $distance
		}

		
		if {[expr $f1%100] == 0} {
			puts $f1
		}
	}
	create_file2 "$output_file.dat" $list_dist
	#exec python /data/DIM//script/distance.py "$output_file.dat"  "$output_file.svg"
}

proc plot_interactions {molid sel1 sel2 f_start f_end dt} {
	global tableauInter
	global outputFile
	set list_dist ""
	set compteur 0
	for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
		set selec1 [atomselect $molid $sel1 frame $f1]
		set selec2 [atomselect $molid $sel2 frame $f1]

		set center1 [measure center $selec1]
		set center2 [measure center $selec2]

		set distance [vecdist $center1 $center2]	

		$selec1 delete
		$selec2 delete
			
		if {$distance < 7 } { 
			set compteur [expr $compteur +1]
		}
		
		if {[expr $f1%100] == 0} {
			puts $f1
		}
	}
	if {[regexp {(name C7A C8A C9A CXA)} $sel1] || [regexp {(name C7A C8A C9A CXA)} $sel2]} {
		set compteur  [expr $compteur * 3 / 4]
	}
	if {[regexp {(name C7A C8A C9A CXA)} $sel1] && [regexp {(name C7A C8A C9A CXA)} $sel2]} {
		set compteur  [expr $compteur * 3 / 4]
	}
	#~ lappend tableauInter $compteur
	puts $outputFile "$compteur"
}

proc plot_interactions_time {molid sel1 sel2 f_start f_end dt} {
	global tableauInter
	global outputFile
	set list_dist ""
	set compteur 0
	for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
		set selec1 [atomselect $molid $sel1 frame $f1]
		set selec2 [atomselect $molid $sel2 frame $f1]

		set center1 [measure center $selec1]
		set center2 [measure center $selec2]

		set distance [vecdist $center1 $center2]	

		$selec1 delete
		$selec2 delete
			
		if {$distance < 7 } { 
			lappend list_dist 1
		} else { lappend list_dist 0 }
		
		if {[expr $f1%100] == 0} {
			puts $f1
		}
	}
	puts $outputFile $list_dist 
}


proc plot_angle {molid sel1 sel2 sel3 f_start f_end dt output_file} {

	set list_angle ""
	
	for { set f1 $f_start } { $f1 < $f_end } { incr f1 $dt } {
		
		set selec1 [atomselect $molid $sel1 frame $f1]
		set selec2 [atomselect $molid $sel2 frame $f1]
		set selec3 [atomselect $molid $sel3 frame $f1]

		set center1 [measure center $selec1]
		set center2 [measure center $selec2]
		set center3 [measure center $selec3]

		set angle_123 [angle $center1 $center2 $center3]

		set distance1 [vecdist $center1 $center2]	
		set distance2 [vecdist $center1 $center3]
		set distance3 [vecdist $center2 $center3]
		$selec1 delete
		$selec2 delete
		$selec3 delete
		
		if {$distance1 < 50 && $distance2 < 50 && $distance3 < 50} { 
			lappend list_angle $angle_123
	 	} else { lappend list_angle 0}
		
		if {[expr $f1%100] == 0} {
			puts $f1
		}
	}

	create_file2 "$output_file.dat" $list_angle
	#~ #exec python /data/DIM//script/distance.py "$output_file.dat"  "$output_file.svg"
}







#foreach index $list_parts {

# puts "$index"
# set index_name [string map { "(" "" ")" ""} [string map {" " ""} $index]]
# RMSD_inside "protein and (resid 3 to 7)" "$index" 2 0 10 1 $index_name
# set name_bb "_bb"
# RMSD_inside "protein and (resid 3 to 7)" "$index and backbone" 2 0 10 1 $index_name$name_bb
#}



