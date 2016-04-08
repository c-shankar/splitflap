radius = 60; //Radius of the circle
rco = 53; // Radius from Center to Outer hole
holes_number = 40; // Number of outer holes
rch = 8;  // Radius of the center hole
ro = 3; // Radius of outer holes
difference(){
    cylinder(h=4,r1=radius,r2=radius,center=false,$fn=300);
    cylinder(h=6,r1=rch,r2=rch,center=false,$fn=300);
    for(a=[0:360/holes_number:360])translate([rco*sin(a),rco*cos(a),0])cylinder(6,ro,ro,false,$fn=10);
        }
