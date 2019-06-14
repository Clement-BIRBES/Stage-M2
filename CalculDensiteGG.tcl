set molid1 [mol new {step7_production.gro} type {gro} first 0 last -1 step 1 waitfor 1]
mol addfile {step7_production.xtc} type {xtc} first 1 last -1 step 1 waitfor -1 $molid1

############################################################################################################
set nf [molinfo top get numframes]
	#Réalise tous les Atomselect sur les parties voulues
	set bicoucheTop [atomselect top "type PO4 and z>30"]
	set bicoucheBot [atomselect top "type PO4 and z<30"]
	set bicoucheCenter [atomselect top "type PO4"]
	set PGL [atomselect top "resname PGL"]
	set TetePolaire [atomselect top "resname PGL and type GB1 GL1 GL2"]
	set Sucre [atomselect top "resname PGL and type B1 B2 B3"]
	set Phenyl [atomselect top "resname PGL and type C8A C9A CXA"]
	set CTerChain1 [atomselect top "resname PGL and type C7B"]
	set CTerChain2 [atomselect top "resname PGL and type C7C"]
	#Ouvre les 7 fichiers sortie
	set outfile1 [open graphesDistance/positionMBTop.csv w]
	set outfile2 [open graphesDistance/positionMBBot.csv w]
	set outfile3 [open graphesDistance/positionPGL.csv w]
	set outfile4 [open graphesDistance/positionTetePol.csv w]
	set outfile5 [open graphesDistance/positionSucre.csv w]
	set outfile6 [open graphesDistance/positionChain1.csv w]
	set outfile7 [open graphesDistance/positionChain2.csv w]
	set outfile8 [open graphesDistance/positionMBCenter.csv w]
	set outfile9 [open graphesDistance/positionPhenyl.csv w]
	#Boucle sur toutes les frames
	for {set i 0} {$i < $nf} {incr i} {
		puts "frame $i of $nf"
		$bicoucheTop frame $i
		$bicoucheBot frame $i
		$PGL frame $i
		$TetePolaire frame $i
		$Sucre frame $i
		$CTerChain1 frame $i
		$CTerChain2 frame $i
		$bicoucheCenter frame $i
		$Phenyl frame $i
		#Calcule le centre de masse sur les groupes d'atomes selectionnées
		set centerBicoucheTop [measure center $bicoucheTop]
		set centerBicoucheBot [measure center $bicoucheBot]
		set centerBicoucheCenter [measure center $bicoucheCenter]
		set centerPGL [measure center $PGL]
		set centerSucre [measure center $Sucre]
		set centerTetePolaire [measure center $TetePolaire]
		set centerCTerChain1 [measure center $CTerChain1]
		set centerCTerChain2 [measure center $CTerChain2]
		set centerPhenyl [measure center $Phenyl]
		
		#Ne conserve que la valeur de Z
		set ZposTetePolaire [lindex $centerTetePolaire 2]
		set ZposSucre [lindex $centerSucre 2]
		set ZposCTerChain1 [lindex $centerCTerChain1 2]
		set ZposCTerChain2 [lindex $centerCTerChain2 2]
		set ZcenterBicoucheTop [lindex $centerBicoucheTop 2]
		set ZcenterBicoucheBot [lindex $centerBicoucheBot 2]
		set ZcenterBicoucheCenter [lindex $centerBicoucheCenter 2]
		set ZcenterPGL [lindex $centerPGL 2]
		set ZposPhenyl [lindex $centerPhenyl 2]

		#Ecris les fichiers sortie
		puts $outfile1 "$i $ZcenterBicoucheTop"
		puts $outfile2 "$i $ZcenterBicoucheBot"
		puts $outfile3 "$i $ZcenterPGL"
		puts $outfile4 "$i $ZposTetePolaire"
		puts $outfile5 "$i $ZposSucre"
		puts $outfile6 "$i $ZposCTerChain1"
		puts $outfile7 "$i $ZposCTerChain2"
		puts $outfile8 "$i $ZcenterBicoucheCenter"
		puts $outfile9 "$i $ZposPhenyl"
	}
	close $outfile1
	close $outfile2
	close $outfile3
	close $outfile4
	close $outfile5
	close $outfile6
	close $outfile7
	close $outfile8
	close $outfile9
	
### Pour visualiser : xmgrace positionMBTop.csv positionMBBot.csv positionTetePol.csv &
### On peut changer le dernier fichier en fonction de ce que 'lon desire visualiser.
############################################################################################################
