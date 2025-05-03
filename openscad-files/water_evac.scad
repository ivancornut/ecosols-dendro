include <BOSL2/std.scad>

module water_evac_channel(hole_size){
    difference(){
        union(){
            torus(id=hole_size+2, od = hole_size+3.5, $fn=100);
            translate([0,(hole_size+3)/2,0]){
                // for water to drip
                sphere(d = 1.5,$fn=100);
            }
        }
        translate([0,-(hole_size+3)/2,0]){
            cube([2,4,4],center = true);
        }
    }
}
//water_evac_channel(10);