# Valeurs d'angles pour certaines parties du PGL 
set molid1 [mol new {step7_production.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {step7_production.xtc} type {xtc} first 0 last -1 step 1 waitfor -1 $molid1

source /home/birbes/Documents/Scripts/ScriptsTCL/plot_N0.tcl
set nf [molinfo top get numframes]

for {set i 3411} {$i < 3419} {incr i} {
	plot_angle top "resid $i and type B2" "resid $i and type C6A" "resid $i and type C3A" 0 $nf 1 Angles/B2_C6A_C3A$i
	plot_angle top "resid $i and type C6A" "resid $i and type C3A" "resid $i and type GB1" 0 $nf 1 Angles/C6A_C3A_GB1$i
	plot_angle top "resid $i and type GB1" "resid $i and type C3A" "resid $i and type C3B" 0 $nf 1 Angles/GB1_C3A_C3B$i
	plot_angle top "resid $i and type GB1" "resid $i and type C3A" "resid $i and type C3C" 0 $nf 1 Angles/GB1_C3A_C3C$i
	plot_angle top "resid $i and type C3A" "resid $i and type C3B" "resid $i and type C7B" 0 $nf 1 Angles/C3A_C3B_C7B$i
	plot_angle top "resid $i and type C3A" "resid $i and type C3C" "resid $i and type C7C" 0 $nf 1 Angles/C3A_C3C_C7C$i
}






