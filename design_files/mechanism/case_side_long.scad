//next version - keep teeth length as a variable parameter
lct = 3; // Laser Cut thickness
t_length = 10;// length of t-slot screw
t_thick = 3;// diameter of t-slot screw
dim_x = 86 + 140 - 50 + t_length ; // Total size excluding lct, now 86
dim_y =  151;//height was 166 before, now 151
nut_dia = 5.75;// diameter of t-slot nut
nut_thick = 2.5;// thickness of t-slot nut
dia_c = 8.2; //diameter of center hole (changed from 8.1)
rad_c = dia_c/2;

tol = .1; //teeth tolerance
bthp = 12;//back t hole position (here back is left side)
fthp = 10;//fromt t hole position (here front is right side)
fth_sep =8; //front t hole separation

difference(){

//cuboid, teeth top & bottom
union(){
    translate([lct,lct,0])cube([dim_x-2*lct,dim_y-2*lct,lct]);//cuboid
    for(x=[lct+tol+4/*offset*/+tol/*as teeth r reduced by tol b4, it should be included in offset*/:32:dim_x-2*lct])translate([x,0,0])cube([16-2*tol,lct,lct]);//teeth bottom
    for(x=[lct+tol+4+tol:32:dim_x-2*lct])translate([x,dim_y-lct,0])cube([16-2*tol,lct,lct]);//teeth top
}

//screw holes top & bottom
union(){
    for(x=[lct+16+((16-t_thick)/2)+4/*offset*/+tol:32:128 + 5/*greater than 4+tol is enough*/ + lct+16+((16-t_thick)/2)])/*x  and 32+x*/translate([x,0,0])color("red")cube([t_thick,t_length,lct]);//screw hole bottom
    for(x=[lct+16+((16-t_thick)/2)+4+tol:32:128+5 + lct+16+((16-t_thick)/2)])translate([x,dim_y-t_length,0])color("red")cube([t_thick,t_length,lct]);//screw hole top
}

//nut holes top & bottom 
union(){
    for(x=[(lct+16+((16-t_thick)/2))/*dist bw O and screwhole*/-((nut_dia-t_thick)/2)/*dist diff screwhole & nuthole*/+4+tol:32:dim_x])translate([x,lct+(t_length-lct-nut_thick)/2,0])cube([nut_dia,nut_thick,lct]);//nut hole bottom
    for(x=[(lct+16+((16-t_thick)/2))/*dist bw O and screwhole*/-((nut_dia-t_thick)/2)/*dist diff screwhole & nuthole*/+4+tol:32:dim_x])translate([x,dim_y-lct-((t_length-lct-nut_thick)/2)-nut_thick,0])cube([nut_dia,nut_thick,lct]);//nut hole top
}

//nut holes left & right
union(){
	for(y=[bthp,dim_y-bthp-t_thick])translate([lct/*lct added, change to 0 if required,tscrew will look small*/,y,0])cube([t_length,t_thick,lct]);//screwhole left side(back)
    for(y=[bthp-((nut_dia-t_thick)/2),dim_y-bthp-((nut_dia-t_thick)/2)-t_thick])translate([lct+((t_length-nut_thick)/2),y,0])cube([nut_thick,nut_dia,lct]);//nuthole left side(back)
    
    
    for(y=[dim_y-fthp-t_thick:-fth_sep:100])translate([dim_x-t_length-lct/*lct added*/,y,0])cube([t_length,t_thick,lct]);//screwhole right side(front)
    for(y=[dim_y-fthp-((nut_dia-t_thick)/2)-t_thick:-fth_sep:100])translate([dim_x-lct-((t_length-nut_thick)/2)-nut_thick,y,0])cube([nut_thick,nut_dia,lct]);//nuthole right side(front)
}

//center hole - 33mm from right of X dimension
translate([dim_x-33,dim_y/2,0])color("blue")cylinder(lct,r1=rad_c,r2=rad_c,center=false,$fn=300);

//motor holes
union(){
    translate([t_length+lct+5,t_length+3,0])cube([100-50+t_length+3-5+40,4,lct]);
    translate([t_length+lct+5,t_length+3+2/*half 4*/+15/* center to center*/-3,0])cube([100-50+t_length+3-5+40,6,lct]);
    translate([t_length+lct+5,t_length+3+2+30-2,0])cube([100-50+t_length+3-5+40,4,lct]);
}
//union(){//back cut hole for back part
//for(y=[bthp+(t_thick/2)-(10/2),dim_y-bthp-(t_thick/2)+//(10/2)])translate([0,y,0]cube([lct+lct,10/*front //part width*/,3]);
//}

}