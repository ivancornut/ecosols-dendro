include <BOSL2/std.scad>
module lvdt_BI404(rotation,offset_to_center,xscaling, zscaling,cylinder_scaling){
    //small_slop_attach = 0.1*scaling;
    color("gray")
    rotate([0,-rotation,0]){
        translate([26.92/2+5,(12.7-7.88)/2,(11.56-8.51+1)/2+8.51-3.56]){
        // the space for wires to attach to the LVDT
            cuboid([20+10, 5,11.56-8.51 +1]);
        }
        zscale(zscaling)
        translate([offset_to_center,-7.88-xscaling/2,-3.56]){
            union(){
                difference(){
                    // main body of the LVDT
                    cube([26.92+10,12.70+xscaling,8.51]);
                    translate([-0.1,3.56-(1.93)/2+xscaling/2,-0.1])
                        // small space that holds the LVDT in place
                        cube([1.50,1.93,8.8]);
                }
                translate([0.1,7.88+xscaling/2,3.56]){
                    // tip of lvdt sensor
                    yscale(zscaling)
                    cylinder(h = 20.57, r = (4.85*cylinder_scaling)/2, orient = LEFT,$fn=100);
                }
            }
        }
    }
}

//lvdt_BI404(0,0,1,1,1.1);