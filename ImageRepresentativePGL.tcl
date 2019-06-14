set molid1 [mol new {../step7_production8PGL.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {../step7_production.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid1
set nf [molinfo top get numframes]
puts "nf = $nf"

set Sucre   "B1 B2 B3"
set Phenyl  "C7A C8A C9A CXA"
set MiC1    "C4A C5A C6A"
set DebutC1 "GB1 C1A C2A"
set DebutC2 "C3A GL1 C1B"
set DebutC3 "C3A GL2 C1C"
set MiC2    "C4B C3B C2B"
set MiC3    "C4C C3C C2C"
set FinC2   "C7B C6B C5B"
set FinC3   "C7C C6C C5C"

set tableauFrame ""



set infile1 [open matriceImageRepresentative_2 r]
set infile2 [open matriceImageRepresentative_4 r]
set infile3 [open matriceImageRepresentative_6 r]
set infile4 [open matriceImageRepresentative_8 r]
set infile5 [open matriceImageRepresentative_10 r]

set file_data1 [read $infile1]
set file_data2 [read $infile2]
set file_data3 [read $infile3]
set file_data4 [read $infile4]
set file_data5 [read $infile5]

lappend megalist [split $file_data1 "\n"]
lappend megalist [split $file_data2 "\n"]
lappend megalist [split $file_data3 "\n"]
lappend megalist [split $file_data4 "\n"]
lappend megalist [split $file_data5 "\n"]


for { set w 0} {$w <= 4 } {incr w 1} { 
	set tableauFrame ""
	for { set i 0} { $i < 10} { incr i 1} {
		for {set j 0} {$j < 10} {incr j 1} {
			if {[lindex [lindex [lindex $megalist $w] $i] $j] == 1} {
				if {$i == 0} {set a "B1 B2 B3"} 
				if {$i == 1} {set a "C7A C8A C9A CXA"}
				if {$i == 2} {set a "C4A C5A C6A"}
				if {$i == 3} {set a "GB1 C1A C2A"}
				if {$i == 4} {set a "C3A GL1 C1B"}
				if {$i == 5} {set a "C3A GL2 C1C"}
				if {$i == 6} {set a "C4B C3B C2B"}
				if {$i == 7} {set a "C4C C3C C2C"}
				if {$i == 8} {set a "C7B C6B C5B"}
				if {$i == 9} {set a "C7C C6C C5C"}
				if {$j == 0} {set b "B1 B2 B3"} 
				if {$j == 1} {set b "C7A C8A C9A CXA"}
				if {$j == 2} {set b "C4A C5A C6A"}
				if {$j == 3} {set b "GB1 C1A C2A"}
				if {$j == 4} {set b "C3A GL1 C1B"}
				if {$j == 5} {set b "C3A GL2 C1C"}
				if {$j == 6} {set b "C4B C3B C2B"}
				if {$j == 7} {set b "C4C C3C C2C"}
				if {$j == 8} {set b "C7B C6B C5B"}
				if {$j == 9} {set b "C7C C6C C5C"}
				for {set frame 0} { $frame < $nf } {incr frame 1} {
					if {[vecdist [measure center [atomselect $molid1 "(name $a) and resid 3411" frame $frame]] [measure center [atomselect $molid1 "(name $b) and resid 3412" frame $frame]]] < 7 } {
						lappend tableauFrame $frame
					}
				}
				lappend tableauFrame ","					
			}
		}
	}
	set y [expr ($w+1)*2]
	set outfile [open "frameOut_$y" w]
	set tableauSplit [split $tableauFrame ","]
	set nombre1 [llength $tableauSplit]
	
	for {set x 0} { $x < [llength [lindex $tableauSplit 0]]} {incr x 1} {
		set k [lindex [lindex $tableauSplit 0] $x]
		for {set m 1} {$m <= $nombre1} {incr m 1} {
			if {([lsearch [lindex $tableauSplit $m] $x] == -1)} {break}
			if {$m == $nombre1-2} {
				puts $outfile $k
				
			}
		}
	}
	close $outfile 
}


	
	
