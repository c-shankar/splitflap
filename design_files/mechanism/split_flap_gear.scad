diameter = 65;//diameter of the circle
radius = diameter/2; //radius of the circle
rco = (diameter-7)/2; // Radius from Center to Outer hole
holes_number = 32; // Number of outer holes (40 previously)
dia_c = 8.1; //diameter of center hole
rch = dia_c/2;  // Radius of the center hole
dia_o = 3.1; //Diameter of outer holes
ro = dia_o/2; // Radius of outer holes
side = 30;
lct = 3; // laser cut thickness
net_side = side + 2*lct;
crh_tol = .25; //center rectangular holes tolerance on left_right of a rectangle
crh_tol2 = .25; // cemter rect hole tol on top_bottom of a rectangle 
difference(){
    
translate([radius,radius,0])difference(){
    cylinder(h=3,r1=radius,r2=radius,center=false,$fn=300);
    cylinder(h=6,r1=rch,r2=rch,center=false,$fn=300);
    for(a=[0:360/holes_number:1000])translate([rco*sin(a),rco*cos(a),0])cylinder(6,ro,ro,false,$fn=50);
    import("four_holes.stl");//center 4 holes
        }
for(y=[((diameter-net_side)/2)+lct-crh_tol:12:(diameter-net_side)/2+net_side])translate([((diameter-net_side)/2)-crh_tol2,y,0])color("red")cube([lct+crh_tol2,6+2*crh_tol,3]);//left
for(x=[((diameter-net_side)/2)+lct-crh_tol:12:(diameter-net_side)/2+net_side])translate([x,((diameter-net_side)/2)-crh_tol2,0])color("red")cube([6+2*crh_tol,lct+2*crh_tol2,3]);//bottom
for(y=[((diameter-net_side)/2)+lct-crh_tol:12:(diameter-net_side)/2+net_side])translate([(diameter-((diameter-net_side)/2)-lct)-crh_tol2,y,0])color("red")cube([lct+crh_tol2,6+2*crh_tol,3]);//right
for(x=[((diameter-net_side)/2)+lct-crh_tol:12:(diameter-net_side)/2+net_side])translate([x,(diameter-((diameter-net_side)/2)-lct)-crh_tol2,0])color("red")cube([6+2*crh_tol,lct+2*crh_tol2,3]);//top
}