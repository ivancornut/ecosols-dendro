include <BOSL2/std.scad>

module holder(width_ziptie,height_holder,diameter_tree,width_center){
    difference(){
        rotate([90,0,0]){ //90
            translate([0,-(diameter_tree/2-(height_holder)),0]){
                difference(){
                    union(){
                        translate([0,diameter_tree/2-height_holder/2,2.5/2+width_ziptie/2]){
                            cuboid([width_center,height_holder,2.5],rounding=7,edges = [LEFT+BACK,RIGHT+BACK]);
                            //cyl(h = 2.5, d = diameter_tree+5, $fn = 500);
                        }
                         //translate([0,diameter_tree/2-height_holder/2,-(2.5/2+width_ziptie/2)]){
                         //   cuboid([width_center,height_holder,2.5],rounding=1);
                        //}
                        translate([0,-4,0]){
                            cyl(h = width_ziptie, d = diameter_tree, $fn = 500);
                        }
                    }
                    // to remove from the circle
                    translate([0,-(height_holder+5),0]){
                        cuboid([diameter_tree+10,diameter_tree+10,10*4]);
                    }
                }
            }
        }
        translate([50/2+(width_center/2),0,0]){
            cuboid([50,50,100]);
        }
        translate([-(50/2+(width_center/2)),0,0]){
            cuboid([50,50,100]);
        }
    }
}


//holder(10,10,50*2,30);