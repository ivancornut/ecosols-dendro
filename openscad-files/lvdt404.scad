include <BOSL2/std.scad>
module lvdt_BI404(rotation,offset_to_center,xscaling, zscaling){
    //small_slop_attach = 0.1*scaling;
    color("gray")
    rotate([0,-rotation,0]){
        translate([26.92/2+5,(12.7-7.88)/2,(11.56-8.51+1)/2+8.51-3.56]){
            cuboid([20+10, 4,11.56-8.51 +1]);
        }
        zscale(zscaling)
        translate([offset_to_center,-7.88-xscaling/2,-3.56]){
            union(){
                difference(){
                    cube([26.92+10,12.70+xscaling,8.51]);
                    //translate([1.4,3.56,-0.1])    
                    //    cylinder(h = 8.8, d = 1.93-small_slop_attach,$fn=100);
                    translate([-0.1,3.56-(1.93)/2+xscaling/2,-0.1])
                        cube([1.50,1.93,8.8]);
                    //translate([1.4+24.13,3.56+xscaling/2,-0.1])
                    //    cylinder(h = 8.8, d = 1.93,$fn=100);
                     //translate([24.13+1.5,3.56-1.93/2+xscaling/2,-0.1])
                     //   cube([1.50,1.93,8.8]);
                }
                translate([0.1,7.88+xscaling/2,3.56]){
                    yscale(zscaling)
                    cylinder(h = 20.57, r = 4.85/2, orient = LEFT,$fn=100);
                }
            }
        }
    }
}

//lvdt_BI404(0,0,1,1);