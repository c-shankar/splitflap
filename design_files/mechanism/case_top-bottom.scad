lct = 3; // Laser Cut thickness
dim_x = 86;
dim_y= 86;
tol = .1;//tolerance for teeth
teeth_extend = 1;
h_tol=.05;//hole tolerance
difference(){

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