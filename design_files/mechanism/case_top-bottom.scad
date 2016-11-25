lct = 3; // Laser Cut thickness
dim_x = 86-5-5;//reduced by 10 mm
dim_y= 86;
tol = .1;//tolerance for teeth
teeth_extend = 1;
h_tol=.05;//hole tolerance
add_cube_dimx=20;
union(){

translate([add_cube_dimx+lct+teeth_extend,0,0])difference(){
translate([teeth_extend,0,0])
union(){
translate([lct,lct,0])cube([dim_x-2*lct,dim_y-2*lct,lct]);//the cube
for(y=[lct+16+tol:32:dim_y-2*lct])translate([0-teeth_extend,y,0])cube([lct+teeth_extend,16-2*tol,lct]);//teeth left
for(y=[lct+16+tol:32:dim_y-2*lct])translate([dim_x-lct,y,0])cube([lct+teeth_extend,16-2*tol,lct]);//teeth right
}
translate([teeth_extend,0,0])
union(){
for(x=[0-h_tol,dim_x-lct-h_tol])for(y=[lct+16+((16-lct)/2)-h_tol:32:dim_y])translate([x,y,0])cube([lct+2*h_tol,lct+2*h_tol,lct]);//screw_head 4 holes
}
}

difference(){
union(){
for(y=[lct+16+tol:32:dim_y-2*lct])translate([0,y,0])cube([lct+teeth_extend,16-2*tol,lct]);//teeth left
translate([lct+teeth_extend,lct,0])cube([add_cube_dimx,dim_y-2*lct,lct]);
}
for(y=[lct+16+((16-lct)/2)-h_tol:32:dim_y])translate([teeth_extend,y,0])cube([lct+2*h_tol,lct+2*h_tol,lct]);
}

}