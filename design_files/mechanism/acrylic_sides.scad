side = 36;
lct = 3 ; //Laser cut sheet thickness
union(){
        translate([lct,lct,0])cube([side-2*lct,side-2*lct,lct]);  //the center cube
        for(x=[lct+6:12:side-lct-1])translate([x,0,0])cube([6,lct,lct]); //bottom
        for(x=[lct+6:12:side-lct-1])translate([x,side-lct,0])cube([6,lct,lct]); //top
        for(y=[lct+6:12:side-lct-1])translate([0,y,0])cube([lct,6,lct]); //left
        for(y=[lct+6:12:side-lct-1])translate([side-lct,y,0])cube([lct,6,lct]);  //right
        }