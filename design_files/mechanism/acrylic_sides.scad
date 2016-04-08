side = 36;
lct = 3 ; //laser cut sheet thickness
tol = 1; //tolerance
union(){
        translate([lct,lct,0])cube([side-2*lct,side-2*lct,lct]);  //the center cube
        for(x=[lct+6+tol:12:side-lct-1])translate([x,tol,0])cube([6-2*tol,lct-tol,lct]); //bottom
        for(x=[lct+6+tol:12:side-lct-1])translate([x,side-lct,0])cube([6-2*tol,lct-tol,lct]); //top
        for(y=[lct+6+tol:12:side-lct-1])translate([tol,y,0])cube([lct-tol,6-2*tol,lct]); //left
        for(y=[lct+6+tol:12:side-lct-1])translate([side-lct,y,0])cube([lct-tol,6-2*tol,lct]);  //right
        }