proc create_top {molid sel filename} {

	set selection [atomselect $molid "$sel"]
	set list_resname [$selection get resname]
	
	set data_file [open $filename w]   		

	foreach name $list_resname {
		puts $data_file "$name\t1 "
	}

	close $data_file
}
