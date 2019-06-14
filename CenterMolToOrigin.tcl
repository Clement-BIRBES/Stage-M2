### Script non automatisé, à modifier / adapter en fonction des résidus ###

set Molecule [atomselect top "resname PGL"]
set Centre [measure center $Molecule]

proc moveby {sel offset} {
  set newcoords {}
  foreach coord [$sel get {x y z}] {
    lvarpush newcoords [vecadd $coord $offset]
  }
  $sel set $newcoords
}

$Molecule moveby {-$Centre} #rentrer valeurs manuellement

En fonction du positionnement de la structure :
$Molecule move [trans x 90]
