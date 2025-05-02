include <BOSL2/std.scad>
include <arm_dendrometer.scad>
include <lvdt404.scad>


//lvdt_BI404(rotation = 90, offset_to_center = 2);
module dendrometer_lvdt(nb_arms,width, height, arm_length){
    color("white")
    difference(){
        union(){
            cuboid([width,width,height], chamfer = 7, edges = "Z");
            translate([-2,-3,height/2+22/2]){
                cuboid([18,19,25], chamfer = 1, edges = "Z");
            }
            if(nb_arms>0){
                dendro_arm(offset_arm = width/2,rot_angle = 0, height = height, l = arm_length);
                if(nb_arms==4) dendro_arm(offset_arm = width/2,rot_angle = 90, height = height, l = arm_length);
                dendro_arm(offset_arm = width/2,rot_angle = 180, height = height, l = arm_length);
                if(nb_arms>2) dendro_arm(offset_arm = width/2,rot_angle = 270, height = height, l = arm_length);
            }
        }
        lvdt_BI404(rotation = 90, offset_to_center = -height/2+3, xscaling = 1, zscaling = 1.1);
        translate([-1,-4.32,24.13+1.40+0.25-height/2+3]){
            rotate([0,90,0]){
                cyl(h = 23, d = 2, $fn = 100);
            }
        }   
    }
    //color([0.5,0.5,0,0.5]) lvdt_BI404(rotation = 90, offset_to_center = -height/2+3, xscaling = 0, zscaling = 1);
    //color([0.7,0,0,0.8]){
    //    translate([-1,-4.32,24.13+1.40+0.25-height/2+3]){
    //        rotate([0,90,0]){
    //            cyl(h = 20, d = 2, $fn = 100);
     //       }
     //   }
    //}
}
dendrometer_lvdt(2,30,10,50);