length = 61;
breadth = 36;
lct = 3; //laser cut sheet thickness (change the length and breadth accordingly)
flag = 1; // change flag for alternate position of teeth
tol = .25; //tolerance
//projection(cut = true) for z=0 plane, cut true gives top view of the object
t_length = 10;// length of t-slot screw
t_thick = 3;// diameter of t-slot screw
nut_dia = 5.75;// diameter of t-slot nut
nut_thick = 2.5;// thickness of t-slot nut
ch_dia = 3.5; //center hole diameter
ch_rad = ch_dia/2;
scr_tol = tol;
move_var = 1.5;//move the nut hole by X value
difference(){
union(){
    translate([lct,lct,0])cube([length-(2*lct),breadth-(2*lct),lct]);  //center cuboid

    for(y=[lct+tol:12:breadth])translate([0,y,0])cube([lct,6-2*tol,lct]);  //left
    for(y=[lct+tol:12:breadth])translate([length-lct,y,0])cube([lct,6-2*tol,lct]);  //right
            
    if(flag == 0){
        for(x=[lct+tol:10:length])translate([x,0,0])cube([5-2*tol,lct,lct]);  //bottom
        for(x=[lct+tol:10:length])translate([x,breadth-lct,0])cube([5-tol*2,lct,lct]);  //top 
       }
    if(flag == 1){
        for(x=[lct+5+tol:10:length-lct-1])translate([x,0,0])cube([5-2*tol,lct,lct]);
        for(x=[lct+5+tol:10:length-lct-1])translate([x,breadth-lct,0])cube([5-2*tol,lct,lct]);
       }
        }
union(){
    translate([0,lct+12+((6-t_thick)/2),0])cube([t_length,t_thick,lct]);//screw hole left
    
    translate([length-t_length,lct+12+((6-t_thick)/2),0])cube([t_length,t_thick,lct]);//screw hole right
    
    translate([move_var + (t_length-nut_thick)/2,(lct+12+((6-t_thick)/2))/*posn of t*/-((nut_dia-t_thick)/2),0])cube([nut_thick,nut_dia,lct]);//nuthole left
    
    translate([length-move_var-((t_length-nut_thick)/2)-nut_thick,(lct+12+((6-t_thick)/2))/*posn of t*/-((nut_dia-t_thick)/2),0])cube([nut_thick,nut_dia,lct]);//nuthole right
    
    for(y=[lct+6-scr_tol:12:breadth-lct-1])translate([(61-lct)/2,y,0])cube([lct,6+2*scr_tol,lct]);//center two holes
    
    translate([length/2,breadth/2,0])cylinder(lct,r1=ch_rad,r2=ch_rad,center=false,$fn=300);//center screw hole
    }
}
