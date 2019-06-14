set molid1 [mol new {/home/birbes/Montage/modelo/CB-MD-1.5us/sys.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]
mol addfile {/home/birbes/Montage/modelo/CB-MD-1.5us/sys10.mdcrd} type {netcdf} first 1 last -1 step 10 waitfor -1 $molid1
mol addfile {/home/birbes/Montage/modelo/CB-MD-1.5us/sys11.mdcrd} type {netcdf} first 1 last -1 step 10 waitfor -1 $molid1


############################################################################################################
set nf [molinfo top get numframes]
	#Réalise tous les Atomselect sur les parties voulues (modifier les positions MB en fonction du positionnement initial de cette MB)
	set bicoucheTop [atomselect top "name P31 O31 O32 O33 O34 and z>90"]
	set bicoucheBot [atomselect top "name P31 O31 O32 O33 O34 and z<90"]
	set bicoucheCenter [atomselect top "name P31 O31 O32 O33 O34"]
	set PGL [atomselect top "resname PGL"]
	set TetePolaire [atomselect top "resname PGL and name O2 O3 O4 O1 O"]
	set Sucre [atomselect top "resname PGL and name C104 O7 C99 C100 O8 C101 O5 C102 C103 O6 C98"]
	set Phenyl [atomselect top "resname PGL and name C92 C93 C94 C95 C96 C97"]
	set CTerChain1 [atomselect top "resname PGL and name C27 C26 C25 C24"]
	set CTerChain2 [atomselect top "resname PGL and name C91 C90 C89 C88"]
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
		$bicoucheCenter frame $i
		$PGL frame $i
		$TetePolaire frame $i
		$Sucre frame $i
		$Phenyl frame $i
		$CTerChain1 frame $i
		$CTerChain2 frame $i
		#Calcule le centre de masse sur les groupes d'atomes selectionnées
		set centerBicoucheTop [measure center $bicoucheTop]
		set centerBicoucheBot [measure center $bicoucheBot]
		set centerBicoucheCenter [measure center $bicoucheCenter]
		set centerPGL [measure center $PGL]
		set centerSucre [measure center $Sucre]
		set centerPhenyl [measure center $Phenyl]
		set centerTetePolaire [measure center $TetePolaire]
		set centerCTerChain1 [measure center $CTerChain1]
		set centerCTerChain2 [measure center $CTerChain2]
		
		#Ne conserve que la valeur de Z
		set ZposTetePolaire [lindex $centerTetePolaire 2]
		set ZposSucre [lindex $centerSucre 2]
		set ZposPhenyl [lindex $centerPhenyl 2]
		set ZposCTerChain1 [lindex $centerCTerChain1 2]
		set ZposCTerChain2 [lindex $centerCTerChain2 2]
		set ZcenterBicoucheTop [lindex $centerBicoucheTop 2]
		set ZcenterBicoucheBot [lindex $centerBicoucheBot 2]
		set ZcenterBicoucheCenter [lindex $centerBicoucheCenter 2]
		set ZcenterPGL [lindex $centerPGL 2]

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

