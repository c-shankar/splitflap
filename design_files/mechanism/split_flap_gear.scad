diameter = 60;//radius of the circle
radius = diameter/2; //diameter of the circle
rco = (diameter-7)/2; // Radius from Center to Outer hole
holes_number = 40; // Number of outer holes
dia_c = 8; //diameter of center hole
rch = dia_c/2;  // Radius of the center hole
dia_o = 3; //Diameter of outer holes
ro = dia_o/2; // Radius of outer holes
side = 30;
lct = 3; // laser cut thickness
net_side = side + 2*lct;
difference(){
translate([radius,radius,0])difference(){
    cylinder(h=3,r1=radius,r2=radius,center=false,$fn=300);
    cylinder(h=6,r1=rch,r2=rch,center=false,$fn=300);
    for(a=[0:360/holes_number:360])translate([rco*sin(a),rco*cos(a),0])cylinder(6,ro,ro,false,$fn=10);
        }
for(y=[((diameter-net_side)/2)+lct:12:(diameter-net_side)/2+net_side])translate([(diameter-net_side)/2,y,0])color("red")cube([lct,6,3]);//left
for(x=[((diameter-net_side)/2)+lct:12:(diameter-net_side)/2+net_side])translate([x,(diameter-net_side)/2,0])color("red")cube([6,lct,3]);//bottom
for(y=[((diameter-net_side)/2)+lct:12:(diameter-net_side)/2+net_side])translate([diameter-((diameter-net_side)/2)-lct,y,0])color("red")cube([lct,6,3]);//right
for(x=[((diameter-net_side)/2)+lct:12:(diameter-net_side)/2+net_side])translate([x,diameter-((diameter-net_side)/2)-lct,0])color("red")cube([6,lct,3]);//top
}