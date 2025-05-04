include <BOSL2/std.scad>
include <arm_dendrometer.scad>
include <lvdt404.scad>
include <water_evac.scad>

nb_arms_dendro = 2;
width_holder = 30; // should not be changed usually
tree_trunk_width = 50; // adapt to your tree
holder_arms_length = tree_trunk_width/2;
height_arms_and_holder = 10; // this will affect the rigidity, 10 is a good compromise

//lvdt_BI404(rotation = 90, offset_to_center = 2);
module dendrometer_lvdt(nb_arms,width, height, arm_length){
    
    diam_screw = 2;
    depth_screw_head = 3;
    size_screw_head = 4;
    size_bolt = 4.75;
    depth_bolt = 1;
    
    color("white")
    difference(){
        union(){
            // The centerpiece that holds the arms
            cuboid([width,width,height], chamfer = 7, edges = "Z");
            
            // the part that goes around the LVDT (the LVDT is cut out from this shape)
            translate([-2,-3,height/2+22/2]){
                cuboid([18,19,25], chamfer = 1, edges = "Z");
            }
            // arms
            if(nb_arms>0){
                dendro_arm(offset_arm = width/2,rot_angle = 0, height = height, l = arm_length);
                if(nb_arms==4) dendro_arm(offset_arm = width/2,rot_angle = 90, height = height, l = arm_length);
                dendro_arm(offset_arm = width/2,rot_angle = 180, height = height, l = arm_length);
                if(nb_arms>2) dendro_arm(offset_arm = width/2,rot_angle = 270, height = height, l = arm_length);
            }
        }
        // we remove the LVDT cutout
        lvdt_BI404(rotation = 90, offset_to_center = -height/2+3, xscaling = 1, zscaling = 1.1,cylinder_scaling = 1.05);
        
        // holes for the screw that holds the LVDT
        translate([-1,-4.32,24.13+1.40+0.25-height/2+3]){
            rotate([0,90,0]){
                cyl(h = 23, d = diam_screw, $fn = 100);

            }
         }
         // hole for the head of the screw
        translate([-9-2,-4.32,24.13+1.40+0.25-height/2+3]){
            rotate([0,90,0]){
                cyl(h=depth_screw_head, d = size_screw_head,$fn = 100);
            }
        }
        translate([+9-2,-4.32,24.13+1.40+0.25-height/2+3]){
            rotate([0,90,0]){
                regular_prism(n=6,od = size_bolt,h=depth_bolt);
            }
        }
        translate([0,0,-height/2]){
        // small channel to evacuate water so that is doesn't go into the LVDT directly
            water_evac_channel(4.85*1.05);
        }
    }
}

dendrometer_lvdt(nb_arms_dendro,width_holder,height_arms_and_holder,holder_arms_length);