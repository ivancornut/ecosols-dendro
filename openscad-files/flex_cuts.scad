include <BOSL2/std.scad>

module cuts_flex(nb, angle_start,angle_stop,diam,depth,height,width){
    cyl(d = diam, h = height+3,$fn=100);
    angle_per_cut = (angle_stop-angle_start)/(nb-1);
    for ( i = [0 : nb-1] ){
        rotate([0,0,i*angle_per_cut+angle_start]){
            translate([-(diam/2+depth)/2,0,0]){
                cuboid([diam/2+depth,width,height+1],rounding = width*0.5,edges=[LEFT+FRONT, LEFT+BACK],$fn = 100);
            }
        }
    }
}
//cuts_flex(4,30,-30,8,1,10,0.4);