diameter = 60;//radius of the circle
radius = diameter/2; //diameter of the circle
rco = (diameter-7)/2; // Radius from Center to Outer hole
holes_number = 40; // Number of outer holes
dia_c = 8; //diameter of center hole
rch = dia_c/2;  // Radius of the center hole
dia_o = 3; //Diameter of outer holes
ro = dia_o/2; // Radius of outer holes
difference(){
    cylinder(h=3,r1=radius,r2=radius,center=false,$fn=300);
    cylinder(h=6,r1=rch,r2=rch,center=false,$fn=300);
    for(a=[0:360/holes_number:360])translate([rco*sin(a),rco*cos(a),0])cylinder(6,ro,ro,false,$fn=10);
        }
