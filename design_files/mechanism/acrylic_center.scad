//4 oles placment error, check tinkercad  https://www.tinkercad.com/things/jVjKJpkIdHv-middlepartitr2
side = 36;
lct = 3 ; //laser cut sheet thickness
tol = .25; //tolerance
t_length = 10;// length of t-slot screw
t_thick = 3;// diameter of t-slot screw
nut_dia = 5.75;// diameter of t-slot nut
nut_thick = 2.5;// thickness of t-slot nut
dia = 8.1; //diameter of center hole
rch = dia/2; //radius of center hole


difference(){
union(){
     translate([lct,lct,0])cube([side-2*lct,side-2*lct,lct]);  //the center cube
     for(x=[lct+6+tol:12:side-lct-1])translate([x,0,0])cube([6-2*tol,lct,lct]); //bottom
     for(x=[lct+6+tol:12:side-lct-1])translate([x,side-lct,0])cube([6-2*tol,lct,lct]); //top
     for(y=[lct+6+tol:12:side-lct-1])translate([0,y,0])cube([lct,6-2*tol,lct]); //left
     for(y=[lct+6+tol:12:side-lct-1])translate([side-lct,y,0])cube([lct,6-2*tol,lct]);  //right
        }
union(){
    translate([side/2,side/2,0])cylinder(lct,r1=rch,r2=rch,center=false,$fn=300);//center hole
    
    translate([0,lct+12+((6-t_thick)/2),0])cube([t_length,t_thick,lct]);//screw-hole left
    
    translate([side-t_length,lct+12+((6-t_thick)/2),0])cube([t_length,t_thick,lct]);//screw-hole right
    
    translate([lct+12+((6-t_thick)/2),0,0])cube([t_thick,t_length,lct]);//screw-hole bottom
    
    translate([lct+12+((6-t_thick)/2),side-t_length,0])cube([t_thick,t_length,lct]);//screw-hole top
    
    translate([lct+((t_length-lct)-nut_thick)/2,(lct+12+((6-t_thick)/2))/*posn of t*/-((nut_dia-t_thick)/2),0])cube([nut_thick,nut_dia,lct]);//nut left
    
    translate([side-lct-((t_length-lct-nut_thick)/2)-nut_thick,(lct+12+((6-t_thick)/2))/*posn of t*/-((nut_dia-t_thick)/2),0])cube([nut_thick,nut_dia,lct]);//nut right
    
    translate([lct+12+(6-t_thick)/2-(nut_dia-t_thick)/2,lct+(t_length-lct-nut_thick)/2,0])cube([nut_dia,nut_thick,lct]);//nut bottom
    
    translate([lct+12+(6-t_thick)/2-(nut_dia-t_thick)/2,side-lct-((t_length-lct-nut_thick)/2)-nut_thick,0])cube([nut_dia,nut_thick,lct]);//nut top
    }
union(){
    
diagonal=sqrt(2)*(side-2*lct);
c4h_r = ((diagonal-dia)/4)+sqrt(2)*lct;//bottomleft hole r
c4h_th = 45; //bottomleft hole theta
c4h_x = c4h_r*cos(c4h_th);//cartesian x
c4h_y = c4h_r*sin(c4h_th);//cartesian y

for(x=[c4h_x,side-c4h_x])for(y=[c4h_y,side-c4h_y])translate([x,y,0])cylinder(lct,r1=lct/2,r2=lct/2,center=false,$fn=300);//4 holes
}
}