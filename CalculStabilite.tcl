# Script pour calculer la stabilité du Lyposome, a étudier
set molid1 [mol new {step6.6_equilibration.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {step7_production.xtc} type {xtc} first 1 last -1 step 1 waitfor -1 $molid1
mol addfile {step7_production.part0002.xtc} type {xtc} first 1 last -1 step 1 waitfor -1 $molid1
mol addfile {step7_production.part0003.xtc} type {xtc} first 1 last -1 step 1 waitfor -1 $molid1
mol addfile {step7_production.part0004.xtc} type {xtc} first 1 last -1 step 1 waitfor -1 $molid1

set lipides [atomselect top "resname POPC DOPE"]
set nf [molinfo top get numframes]
set rayonX1 0
set rayonX2 0
set rayonY1 0
set rayonY2 0
set rayonZ1 0
set rayonZ2 0
set boxA 0
set boxB 0
set boxC 0

for {set i 0} {$i < $nf} {incr i} {
		puts "frame $i of $nf"
		$lipides frame $i
		
		set rX1 $rayonX1
		set rX2 $rayonX2
		set rY1 $rayonY1
		set rY2 $rayonY2
		set rZ1 $rayonZ1
		set rZ2 $rayonZ2
		set box_A $boxA
		set box_B $boxB
		set box_C $boxC
		
		set minmaxLipides [measure minmax $lipides]
		set minLipides [lindex $minmaxLipides 0]
		set XminLipides [lindex $minLipides 0]
		set YminLipides [lindex $minLipides 1]
		set ZminLipides [lindex $minLipides 2]
		
		set maxLipides [lindex $minmaxLipides 1]
		set XmaxLipides [lindex $maxLipides 0]
		set YmaxLipides [lindex $maxLipides 0]
		set ZmaxLipides [lindex $maxLipides 0]
		
		set centerLipides [measure center $lipides]
		set XcenterLipides [lindex $centerLipides 0]
		set YcenterLipides [lindex $centerLipides 1]
		set ZcenterLipides [lindex $centerLipides 2]
		
		set rayonX1 [expr $XmaxLipides - $XcenterLipides]
		set rayonX2 [expr $XcenterLipides - $XminLipides]
		set rayonY1 [expr $YmaxLipides - $YcenterLipides]
		set rayonY2 [expr $YcenterLipides - $YminLipides]
		set rayonZ1 [expr $ZmaxLipides - $ZcenterLipides]
		set rayonZ2 [expr $ZcenterLipides - $ZminLipides]
		
		set diffRX1 [expr {abs($rayonX1 - $rX1)}] 
		set diffRX2 [expr {abs($rayonX2 - $rX2)}] 
		set diffRY1 [expr {abs($rayonY1 - $rY1)}] 
		set diffRY2 [expr {abs($rayonY2 - $rY2)}]
		set diffRZ1 [expr {abs($rayonZ1 - $rZ1)}] 
		set diffRZ2 [expr {abs($rayonZ2 - $rZ2)}]
		
		puts $diffRX1
		puts $diffRX2
		puts $diffRY1
		puts $diffRY2
		puts $diffRZ1
		puts $diffRZ2
		
		set boxA [molinfo top get a frame $i]
		set boxB [molinfo top get b frame $i]
		set boxC [molinfo top get c frame $i]

		
		set diffA [expr {abs($boxA - $box_A)}]
		set diffB [expr {abs($boxB - $box_B)}]
		set diffC [expr {abs($boxC - $box_C)}]
		
		puts $diffA
		puts $diffB
		puts $diffC
		
		}
