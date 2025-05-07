include <BOSL2/std.scad>
include <arm_dendrometer.scad>
include <lvdt404.scad>
include <holder.scad>

nb_arms_dendro = 2;
width_holder = 22.5; // should not be changed usually
tree_trunk_width = 100; // adapt to your tree
holder_arms_length = tree_trunk_width/2 + (30-width_holder)/2;
height_arms_and_holder = 10; // this will affect the rigidity, 10 is a good compromise

module dendrometer_holder(nb_arms,width, height, arm_length){
    ziptie_width = 11.5;
    color("white")
    //difference(){
        union(){
        // the main body of the structure
            cuboid([width,width-5,height], chamfer = 2, edges = [TOP+FRONT,TOP+BACK]);
            if(nb_arms>0){
                dendro_arm(offset_arm = width/2,rot_angle = 0, height = height, l = arm_length);
                if(nb_arms==4) dendro_arm(offset_arm = width/2,rot_angle = 90, height = height, l = arm_length);
                dendro_arm(offset_arm = width/2,rot_angle = 180, height = height, l = arm_length);
                if(nb_arms>2) dendro_arm(offset_arm = width/2,rot_angle = 270, height = height, l = arm_length);
            }
            // The two holders for the flexible zip-ties
            translate([0,-((width-5)+ziptie_width)/2,-height/2]){
                holder(ziptie_width,height,arm_length*2,width);
                }
            translate([0,+((width-5)+ziptie_width)/2,-height/2]){
                rotate([0,0,180]){
                    holder(ziptie_width,height,arm_length*2,width);
                }
            }
        }
        // Following are the holes that make the dendrometer consume less plastic and more rigid
        //rotate([90,0,0]){
        //    translate([-6,0,0]){
        //        cylinder(d = 7,h=,center = true,$fn = 100);
        //    }
        //    translate([6,0,0]){
        //        cylinder(d = 7,h=0,center = true,$fn = 100);
        //    }
        //}
    //}
}
dendrometer_holder(nb_arms_dendro,width_holder,height_arms_and_holder,holder_arms_length);