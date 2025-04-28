include <BOSL2/std.scad>
include <arm_dendrometer.scad>
include <lvdt404.scad>
include <holder.scad>


//lvdt_BI404(rotation = 90, offset_to_center = 2);
module dendrometer_holder(nb_arms,width, height, arm_length){
    color("white")
        union(){
            cuboid([width,width,height], chamfer = 0, edges = "Z");
            if(nb_arms>0){
                dendro_arm(offset_arm = width/2,rot_angle = 0, height = height, l = arm_length);
                if(nb_arms==4) dendro_arm(offset_arm = width/2,rot_angle = 90, height = height, l = arm_length);
                dendro_arm(offset_arm = width/2,rot_angle = 180, height = height, l = arm_length);
                if(nb_arms>2) dendro_arm(offset_arm = width/2,rot_angle = 270, height = height, l = arm_length);
            }
            translate([0,-(width-(5+10)/2),-height/2]){
                holder(11.5,height,arm_length*2,width);
                }
            translate([0,+(width-(5+10)/2),-height/2]){
                holder(11.5,height,arm_length*2,width);
                }
        }
 }   
//dendrometer_holder(2,30,10,50);