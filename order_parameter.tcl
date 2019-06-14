set molid1 [mol new {340.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {whole340.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid1

# create the ouput files to use for the python script
proc create_file {filename list} {

    set data_file [open $filename w]   
    set list_length [llength $list]
  
  	for { set i 0 } { $i < $list_length } { incr i 1 } {
  	  
  		puts $data_file [lindex $list $i]  	
  	}
  	 	close $data_file
}

  proc principal_axe {molid sel frame} {

	set selection [atomselect $molid $sel frame $frame]
	set inertia [measure inertia $selection]
	set dir [lindex [lindex $inertia 1] 2] 	

	$selection delete

	return $dir

  }

  proc plot_vec2 {molid coord_center vec} {

	set center_x [lindex $coord_center 0]
	set center_y [lindex $coord_center 1]
	set center_z [lindex $coord_center 2]

	set dir1_x [expr $center_x + 3*[lindex $vec 0]]
	set dir1_y [expr $center_y + 3*[lindex $vec 1]]
	set dir1_z [expr $center_z + 3*[lindex $vec 2]]

	graphics $molid color yellow
	graphics $molid sphere "$center_x $center_y $center_z" radius 0.5 resolution 20

	graphics $molid color red
	graphics $molid sphere "$dir1_x $dir1_y $dir1_z" radius 0.5 resolution 20
	graphics $molid line "$center_x $center_y $center_z" "$dir1_x $dir1_y $dir1_z" 


  }

  proc plot_vec {molid dir} {

	set center_x [lindex [lindex $dir 0] 0]
	set center_y [lindex [lindex $dir 0] 1]
	set center_z [lindex [lindex $dir 0] 2]

	set dir1_x [expr $center_x + 10*[lindex [lindex [lindex $dir 1] 0] 0]]
	set dir1_y [expr $center_y + 10*[lindex [lindex [lindex $dir 1] 0] 1]]
	set dir1_z [expr $center_z + 10*[lindex [lindex [lindex $dir 1] 0] 2]]

	set dir2_x [expr $center_x - 10*[lindex [lindex [lindex $dir 1] 1] 0]]
	set dir2_y [expr $center_y - 10*[lindex [lindex [lindex $dir 1] 1] 1]]
	set dir2_z [expr $center_z - 10*[lindex [lindex [lindex $dir 1] 1] 2]]

	set dir3_x [expr $center_x - 10*[lindex [lindex [lindex $dir 1] 2] 0]]
	set dir3_y [expr $center_y - 10*[lindex [lindex [lindex $dir 1] 2] 1]]
	set dir3_z [expr $center_z - 10*[lindex [lindex [lindex $dir 1] 2] 2]]

	graphics $molid color yellow
	graphics $molid sphere "$center_x $center_y $center_z" radius 2.0 resolution 20

	graphics $molid color red
	graphics $molid sphere "$dir1_x $dir1_y $dir1_z" radius 2.0 resolution 20
	graphics $molid line "$center_x $center_y $center_z" "$dir1_x $dir1_y $dir1_z" 

	#graphics $molid color blue
	#graphics $molid sphere "$dir2_x $dir2_y $dir2_z" radius 2.0 resolution 20
	#graphics $molid line "$center_x $center_y $center_z" "$dir2_x $dir2_y $dir2_z" 

	#graphics $molid color green
	#graphics $molid sphere "$dir3_x $dir3_y $dir3_z" radius 2.0 resolution 20
	#graphics $molid line "$center_x $center_y $center_z" "$dir3_x $dir3_y $dir3_z" 

  }

  proc in_inter {molid sel1 sel2 frame_start frame_end dt cutoff} {

	set resid_list [lsort -unique -integer [[atomselect $molid $sel1] get resid]]
	
	foreach resid $resid_list {
	
		set f_in_contact 0

 	 	for { set f1 $frame_start } { $f1 <= $frame_end } { incr f1 $dt } {
		
 			set contact [atomselect $molid "(all within $cutoff of $sel2) and ($sel1 and resid $resid)" frame $f1 ]			
			set contact_count [$contact num] 			
			if {$contact_count > 0} {
				set f_in_contact [expr $f_in_contact +1]
			}
			
			$contact delete
			
 		}
			if {$f_in_contact > [expr 0.5*($frame_end-$frame_start)/($dt*1.0)]} {
				puts "$resid\t$f_in_contact"
			}
	}

  }


  proc order_parameter_sn1 {molid sel frame_start frame_end dt} {

	set resid_list [lsort -unique -integer [[atomselect $molid $sel] get resid]]
	puts "$resid_list"	

	set list_Smol_global ""
	
	foreach resid $resid_list {
	
		set list_Smol ""

	
                  puts " Resid $resid :"
	
		for {set i 2} {$i < 17} {incr i 1} {

		   set Smol_avg 0 
		   set list_index ""
		
                   puts "    C$i" 

   	           for {set frame $frame_start} {$frame < $frame_end} {incr frame $dt} {



			set H1_name "H"
			set H2_name "H"
			set H1_name [append H1_name $i "S"] 
			set H2_name [append H2_name $i "R"] 
			set C_name "C1$i"
			set sel_C [atomselect $molid "$sel and resid $resid and type $C_name " frame $frame]
			set sel_H1 [atomselect $molid "$sel and resid $resid and type $H1_name " frame $frame]
			set sel_H2 [atomselect $molid "$sel and resid $resid and type $H2_name " frame $frame]
			set coord_C [lindex [ $sel_C get {x y z}] 0]
			set coord_H1 [lindex [ $sel_H1 get {x y z}] 0]
			set coord_H2 [lindex [ $sel_H2  get {x y z}] 0]

			set vector1 [vecnorm [vecsub "[lindex $coord_H1 0] [lindex $coord_H1 1] [lindex $coord_H1 2]" "[lindex $coord_C 0] [lindex $coord_C 1] [lindex $coord_C 2]"] ]
			set vector2 [vecnorm [vecsub "[lindex $coord_H2 0] [lindex $coord_H2 1] [lindex $coord_H2 2]" "[lindex $coord_C 0] [lindex $coord_C 1] [lindex $coord_C 2]"] ]

			set vector [vecnorm [veccross "[lindex $vector2 0] [lindex $vector2 1] [lindex $vector2 2]" "[lindex $vector1 0] [lindex $vector1 1] [lindex $vector1 2]" ]] 
			set costetha [vecdot "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]" "0 0 1"]			
			set Smol [expr (((3*$costetha*$costetha)-1.0)/2.0)]
			set Smol_avg [expr $Smol_avg+$Smol]
			#plot_vec2 $molid "[lindex $coord_C 0] [lindex $coord_C 1] [lindex $coord_C 2]" "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]"

			$sel_C delete
			$sel_H1 delete
			$sel_H2 delete
		     }
			set Smol_avg [expr ($Smol_avg*$dt/(($frame_end-$frame_start)*1.0))]
			lappend list_Smol $Smol_avg
			

		}
	
		
		lappend list_Smol_global $list_Smol


	    }

	set list_Smol_avg ""  
	set list_index ""

	  for {set i 0} {$i < [llength [lindex $list_Smol_global 0]]} {incr i 1} {

		set Smoli 0 

		for {set j 0} {$j < [llength $list_Smol_global]} {incr j 1} {

			set Smoli [expr $Smoli + [lindex [lindex $list_Smol_global $j] $i]]
		}
		lappend list_index $i
		set Smoli_avg [expr $Smoli / (1.0*[llength $list_Smol_global])]
		lappend list_Smol_avg $Smoli_avg	
	  }

	  set plothandle [multiplot -x $list_index -y $list_Smol_avg -title "normal vs time" -lines -linewidth 3 -marker point -plot]	
}
	  




  proc inertia {molid sel frame} {

	set selection [atomselect $molid $sel frame $frame]
	set inertia [measure inertia $selection]

	$selection delete

	plot_vec $molid $inertia 
	return $inertia

  }

  proc mb_normal_vs_time {molid sel frame_start frame_end dt} {

	set list_dot ""
        set list_frame ""

   	for {set frame $frame_start} {$frame < $frame_end} {incr frame $dt} {

	set vector [lindex [lindex [inertia $molid $sel $frame] 1] 0]
	set costetha [vecdot "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]" "0 0 1"]
	
	lappend list_dot $costetha
	lappend list_frame $frame
	
	}
	set plothandle [multiplot -x $list_frame -y $list_dot -title "normal vs time" -lines -linewidth 3 -marker point -plot]
  }
  

  proc dot_vs_time {molid sel frame_start frame_end dt hex_factor filename_Smol filename_La} {

        set list_bonds {""}

	set list_dot ""
	set list_frame ""	
	set list_Smol ""
	set list_ratio_La ""

	set resid_list [lsort -unique -integer [[atomselect $molid $sel] get resid]]
	
	for {set frame $frame_start} {$frame < $frame_end} {incr frame $dt} {
	
	     set sum_Smol 0	
             set sum_La 0
	     set sum_He 0
	     set counter_in_box 0
             set counter_out_box 0			
 
             foreach resid $resid_list {

		#set in_box [check_in_box $molid "$sel and resid $resid" $frame]
		set in_box 1
		
		
		if {$in_box == 1} {

			set vector [vecnorm [principal_axe $molid "$sel and resid $resid" $frame]]		
			set costetha [vecdot "[lindex $vector 0] [lindex $vector 1] [lindex $vector 2]" "0 0 1"]
			set Smol [expr (3*$costetha*$costetha-1)/2]
			incr counter_in_box

			set sum_Smol [expr $sum_Smol+$Smol]
			#lappend Smol_time $Smol
			if {$Smol < $hex_factor} {
				incr sum_He
			} else {
				incr sum_La			
			}
		} else {incr counter_out_box }
		
            }
		set avg_Smol [expr $sum_Smol/([llength $resid_list]*1.0)]
		set ratio_La [expr $sum_La /(($sum_La+$sum_He)*1.0)]
		set in_box_ratio [expr $counter_in_box/(($counter_in_box+$counter_out_box)*1.0)]


		lappend list_Smol "$frame\t$avg_Smol"
		lappend list_frame $frame
		lappend list_ratio_La "$frame\t$ratio_La"
		puts "$frame $in_box_ratio"
	} 

	
	create_file $filename_Smol $list_Smol
	create_file $filename_La $list_ratio_La
	set plothandle [multiplot -x $list_frame -y $list_Smol -title "Smol vs time" -lines -linewidth 3 -marker point -plot]
	set plothandle [multiplot -x $list_frame -y $list_ratio_La -title "Ratio La vs time" -lines -linewidth 3 -marker point -plot]

  }

dot_vs_time top "resname POPC" 0 3000 10 1 Smol La



