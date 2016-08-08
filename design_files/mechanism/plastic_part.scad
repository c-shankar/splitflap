side = 36;
lct = 8 ; //laser cut sheet thickness
dia = 8.1; //diameter of center hole
rch = dia/2; //radius of center hole
t_length = 10;// length of t-slot screw
nut_dia = 5.75;// diameter of t-slot nut

c4h_dia = 3;//center 4 holes radius

cube_par = 1; //parameter to vary cube size
diagonal=sqrt(2)*(side-2*c4h_dia);
c4h_r = ((diagonal-dia)/4)+sqrt(2)*c4h_dia;//bottomleft hole r
c4h_th = 45; //bottomleft hole theta
c4h_x = c4h_r*cos(c4h_th);//cartesian x
c4h_y = c4h_r*sin(c4h_th);//cartesian y


cube_bl_x = c4h_x-(c4h_dia/2)-cube_par;//cube bottom left x
cube_bl_y = c4h_y-(c4h_dia/2)-cube_par;//cube bottom left y
cube_br_x = side - cube_bl_x;//cube bottom right x
cube_br_y = side - cube_bl_y;//cube bottom right y
cube_side = cube_br_x - cube_bl_x;

rhole_len = t_length;//rectangular hole length
rhole_wid = nut_dia;//rectangular hole width
difference(){


translate([cube_bl_x,cube_bl_y,0])cube([cube_side,cube_side,lct]);


union(){
translate([side/2,side/2,0])cylinder(lct,r1=rch,r2=rch,center=false,$fn=300);//center hole
for(x=[c4h_x,side-c4h_x])for(y=[c4h_y,side-c4h_y])translate([x,y,0])cylinder(lct,r1=c4h_dia/2,r2=c4h_dia/2,center=false,$fn=300);//4 holes
}

union(){//recthole
for(x=[0,side-rhole_len])translate([x,(side-rhole_wid)/2,0])cube([rhole_len,rhole_wid,lct]);//left right
for(y=[0,side-rhole_len])translate([(side-rhole_wid)/2,y,0])cube([rhole_wid,rhole_len,lct]);//up down
}

union(){//z axis hole
//translate()cylinder();
}
}