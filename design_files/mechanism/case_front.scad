lct=3;//laser cut thickness
hole_tolerance=.05;
dim_x = 76+lct+lct;
dim_y = 30;// 20 previously, then 46
solid_below_hole = 5;
hole_length = 9;

difference(){
    //cuboid
    cube([dim_x,dim_y,lct]);
    //screw holes
    for(x=[lct-hole_tolerance, dim_x-(lct*2)-hole_tolerance]) translate([x,solid_below_hole,0]) color("red") cube([lct+2*hole_tolerance,hole_length,lct]);
}