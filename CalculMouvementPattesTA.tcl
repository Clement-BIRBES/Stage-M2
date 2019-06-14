set molid1 [mol new {sys.pdb} type {pdb} first 0 last -1 step 1 waitfor 1]
mol addfile {sys10.mdcrd} type {netcdf} first 0 last -1 step 20 waitfor -1 $molid1

############################################################################################################
	set nf [molinfo top get numframes]
	#Réalise tous les Atomselect sur les parties voulues
	set Centre [atomselect top "resname PGL and type C32 C49 C50 C51"]
	set TetePolaire [atomselect top "resname PGL and type C999 C57 C58 O2"]
	set Sucre [atomselect top "resname PGL and type C103 C102 C101 C100 C99 C98 O5 O6 O7 O8 C104"]
	set CTerChain1 [atomselect top "resname PGL and type C91"]
	set CTerChain2 [atomselect top "resname PGL and type C27"]
	
	set TetePOPC [atomselect top "resid 316 317 318 and type N31 C32 C33 C34 C35"]
	set CentrePOPC [atomselect top "resid 316 317 318 and type C1 C2 C3 O11 O21"]
	set CTerChain1POPC [atomselect top "resid 318 and type C114"]
	set CTerChain2POPC [atomselect top "resid 316 and type C114"]

	#Ouvre les 7 fichiers sortie
	set outfile1 [open MouvementPattes/positionCentre.csv w]
	set outfile2 [open MouvementPattes/positionTetePol.csv w]
	set outfile3 [open MouvementPattes/positionSucre.csv w]
	set outfile4 [open MouvementPattes/positionChain1.csv w]
	set outfile5 [open MouvementPattes/positionChain2.csv w]
	
	set outfile6 [open MouvementPattes/positionTetePOPC.csv w]
	set outfile7 [open MouvementPattes/positionCentrePOPC.csv w]
	set outfile8 [open MouvementPattes/positionChain1POPC.csv w]
	set outfile9 [open MouvementPattes/positionChain2POPC.csv w]


	#Boucle sur toutes les frames
	for {set i 0} {$i < $nf} {incr i} {
		puts "frame $i of $nf"
		$Centre frame $i
		$TetePolaire frame $i
		$Sucre frame $i
		$CTerChain1 frame $i
		$CTerChain2 frame $i
		
		$TetePOPC frame $i
		$CentrePOPC frame $i
		$CTerChain1POPC frame $i
		$CTerChain2POPC frame $i

		#Calcule le centre de masse sur les groupes d'atomes selectionnées
		set centerCentre [measure center $Centre]
		set centerSucre [measure center $Sucre]
		set centerTetePolaire [measure center $TetePolaire]
		set centerCTerChain1 [measure center $CTerChain1]
		set centerCTerChain2 [measure center $CTerChain2]
		
		set centerCentrePOPC [measure center $CentrePOPC]
		set centerTetePOPC [measure center $TetePOPC]
		set centerCTerChain1POPC [measure center $CTerChain1POPC]
		set centerCTerChain2POPC [measure center $CTerChain2POPC]
		
	
		#Ne conserve que la valeur de X et Y
		set XposTetePolaire [lindex $centerTetePolaire 0]
		set XposSucre [lindex $centerSucre 0]
		set XposCTerChain1 [lindex $centerCTerChain1 0]		
		set XposCTerChain2 [lindex $centerCTerChain2 0]		
		set XposCentre [lindex $centerCentre 0]		
				
		set YposTetePolaire [lindex $centerTetePolaire 1]		
		set YposSucre [lindex $centerSucre 1]		
		set YposCTerChain1 [lindex $centerCTerChain1 1]		
		set YposCTerChain2 [lindex $centerCTerChain2 1]		
		set YposCentre [lindex $centerCentre 1]		
		
		
		set XposTetePOPC [lindex $centerTetePOPC 0]
		set XposCTerChain1POPC [lindex $centerCTerChain1POPC 0]		
		set XposCTerChain2POPC [lindex $centerCTerChain2POPC 0]		
		set XposCentrePOPC [lindex $centerCentrePOPC 0]		
				
		set YposTetePOPC [lindex $centerTetePOPC 1]		
		set YposCTerChain1POPC [lindex $centerCTerChain1POPC 1]		
		set YposCTerChain2POPC [lindex $centerCTerChain2POPC 1]		
		set YposCentrePOPC [lindex $centerCentrePOPC 1]	

		#Ecris les fichiers sortie
		puts $outfile1 "$XposCentre $YposCentre"
		puts $outfile2 "$XposTetePolaire $YposTetePolaire"
		puts $outfile3 "$XposSucre $YposSucre"
		puts $outfile4 "$XposCTerChain1 $YposCTerChain1"
		puts $outfile5 "$XposCTerChain2 $YposCTerChain2"
		
		puts $outfile6 "$XposTetePOPC $YposTetePOPC"
		puts $outfile7 "$XposCentrePOPC $YposCentrePOPC"
		puts $outfile8 "$XposCTerChain1POPC $YposCTerChain1POPC"
		puts $outfile9 "$XposCTerChain2POPC $YposCTerChain2POPC"

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
