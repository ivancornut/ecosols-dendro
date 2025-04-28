include <dendrometer_holder.scad>
include <dendrometer_lvdt.scad>

diameter_tree = 100;
nb_arms = 2;
width_dendro_center = 30;

dendrometer_holder(nb_arms,width_dendro_center,10,diameter_tree/2);
translate([0,0,-diameter_tree]){
    rotate([180,0,0]){
        dendrometer_lvdt(nb_arms,width_dendro_center,10,diameter_tree/2);
    }
}