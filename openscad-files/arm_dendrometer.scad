include <BOSL2/std.scad>


module dendro_arm(offset_arm, rot_angle,height,l){
    length_arm = l;
    width_arm = 16 ;
    height_arm = height ;

    c_tube_diam = 8 ;
    tube_holder_width = 3.5;
    tube_slack = 0.35;

    tube_tight_l = 6; 
    tube_tight_w = 10;
    tube_holder_diam = c_tube_diam + tube_holder_width*2;
    screw_diam = 2;
    tight_screw_offset = tube_holder_diam/2 +0.5;
    //translate([])
    color("white")
    rotate([0,0,rot_angle]){
        translate([length_arm/2+offset_arm,0,0]){
            union(){
                cuboid([length_arm,width_arm,height_arm], chamfer = 2, edges = "X",$fn = 100);
                translate([length_arm/2+tube_holder_diam/2,0,0]){
                    difference(){
                        union(){
                            translate([-tube_holder_diam/4,0,0]){
                                cube([tube_holder_diam/2,tube_holder_diam,height_arm],center = true);
                             }
                             cylinder(d = tube_holder_diam, h = height_arm, center = true,$fn=100);
                             translate([tube_holder_diam/2,0,0]){
                                // the cube to tighten the carbon fiber tube
                                cube([tube_holder_width+tube_tight_l,tube_tight_w,height_arm], center = true);
                             } 
                        }
                        // the hole for the tube to fit in
                        cyl(d = c_tube_diam+tube_slack, h = height_arm+0.1,chamfer = -1,$fn=100);
                        translate([tube_holder_diam/2,0,0]){
                            // hole between the two parts that tighten
                            cube([tube_holder_width+tube_tight_l+0.1,2.5,height_arm+0.1], center = true);
                        }
                        translate([tight_screw_offset,0,0]){
                            rotate([90,0,0]){
                                // the hole for the tightening screw
                                cylinder(d = screw_diam+0.25,h = tube_holder_diam+2, center = true,$fn=100);
                                translate([0,0,tube_tight_w/2]){
                                    cylinder(d = 4,h=1,center = true,$fn=100);
                                }
                                translate([0,0,-(tube_tight_w/2)]){
                                    regular_prism(n=6,od = 4.75,h=1,center = true);
                                }
                            }                       
                        }                  
                    }
                }
                attachment = 10;
                length_ellipse = length_arm + attachment;
                width_ellipse = width_arm-12;
                translate([-2,-(width_ellipse)/2,0]){
                    rotate([-90,0,0]){
                        linear_extrude(width_ellipse){
                            difference(){
                                ellipse(d=[length_ellipse,30],$fn=100);
                                translate([-length_ellipse/2-1,0,0]){
                                    square([length_ellipse+3,15]);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

}

//dendro_arm(0,0,10,20);

