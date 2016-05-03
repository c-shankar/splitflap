lct=3;//laser cut thickness
h_tol=.05;//hole tolerance
dim_x = 86+lct+lct;
dim_y = 10;
difference(){
cube([dim_x,dim_y,lct]);//the cuboid
for(x=[lct-h_tol,dim_x-(lct*2)-h_tol])translate([x,((dim_y-lct)/2)-h_tol,0])cube([lct+2*h_tol,lct+2*h_tol,lct]);//screw holes

}