length = 61;
breadth = 36;
lct = 3; //laser cut sheet thickness (change the length and breadth accordingly)
flag = 0; // change flag for alternate position of teeth
tol = 1; //tolerance
union(){
        translate([lct,lct,0])cube([length-(2*lct),breadth-(2*lct),lct]);  //center cuboid

        for(y=[lct+tol:12:breadth])translate([tol,y,0])cube([lct-tol,6-2*tol,lct]);  //left
        for(y=[lct+tol:12:breadth])translate([length-lct,y,0])cube([lct-tol,6-2*tol,lct]);  //right
            
        if(flag == 0){
            for(x=[lct+tol:10:length])translate([x,tol,0])cube([5-2*tol,lct-tol,lct]);  //bottom
            for(x=[lct+tol:10:length])translate([x,breadth-lct,0])cube([5-tol*2,lct-tol,lct]);  //top 
        }
        if(flag == 1){
            for(x=[lct+5+tol:10:length-lct-1])translate([x,tol,0])cube([5-2*tol,lct-tol,lct]);
            for(x=[lct+5+tol:10:length-lct-1])translate([x,breadth-lct,0])cube([5-2*tol,lct-tol,lct]);
        }
        }