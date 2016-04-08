length = 61;
breadth = 36;
lct = 3; //Laser cut sheet thickness (change the length and breadth accordingly)
flag = 0; // change flag for alternate position of teeth
union(){
        translate([lct,lct,0])cube([length-(2*lct),breadth-(2*lct),lct]);  //center cuboid

        for(y=[lct:12:breadth])translate([0,y,0])cube([lct,6,lct]);  //left
        for(y=[lct:12:breadth])translate([length-lct,y,0])cube([lct,6,lct]);  //right
            
        if(flag == 0){
            for(x=[lct:10:length])translate([x,0,0])cube([5,lct,lct]);  //bottom
            for(x=[lct:10:length])translate([x,breadth-lct,0])cube([5,lct,lct]);  //top 
        }
        if(flag == 1){
            for(x=[lct+5:10:length-lct-1])translate([x,0,0])cube([5,lct,lct]);
            for(x=[lct+5:10:length-lct-1])translate([x,breadth-lct,0])cube([5,lct,lct]);
        }
        }