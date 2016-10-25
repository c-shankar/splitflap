//rotate([a, b, c]) { ... }; use c for rotation about z

//gear parameters
gear_diameter = 65; //gear diameter
holes_number = 32; //no of outer holes in the gear
gear_edge_to_outer_hole_edge_dist = 2; // constant

//holder parameters
holder_height_outer = 15;
holder_height_inner = 8;

holder_width_outer = 18;
holder_width_inner = 10;

flaphole_width = 3;
reduce_flaphole_width = .6; //reduce hole width by this value 
holder_edge_thickness = 2; //excluding width

//holder attachment
holder_attach_thickness = 3;
holder_attach_height = 3;

//flap parameters
flap_attacher_width = 2; //always constant
flap_body_width = 40; // constant , total flap width is flap_attacher_width + flap_body_width

//calculations
gear_radius = gear_diameter/2;
outer_radius = gear_radius - gear_edge_to_outer_hole_edge_dist + flap_body_width + holder_edge_thickness;
two_holders_width = holder_width_inner + holder_width_outer + holder_edge_thickness;
inner_most_radius = outer_radius - two_holders_width;

module flap_holder(holder_height, holder_width){
    //calculations that depend on holder_width
    total_holder_width = holder_width + holder_edge_thickness;
    inner_radius = outer_radius - total_holder_width;

    difference(){
    cylinder(h=holder_height, r1=outer_radius, r2=outer_radius, center=false, $fn=300);
    cylinder(h=holder_height, r1=inner_radius, r2=inner_radius, center=false, $fn=300);
    for(a=[0:360/holes_number:1000])rotate([0,0,a])translate([0,0,3])cube([outer_radius-holder_edge_thickness, flaphole_width-reduce_flaphole_width, holder_height]);
    }
}
module complete_support(){
    union(){
        flap_holder(holder_height_outer,holder_width_outer);//without extra 10mm hole_width and with 15mm height
        flap_holder(holder_height_inner,holder_width_inner+holder_width_outer);//extra 10mm hole_width and 8mm height
    }
}
module 120deg_cut(start_degree, end_degree){ //end_degree > start_degree
    intersection(){
        union(){
            rotate([0,0,start_degree])cube([outer_radius, outer_radius, 15/*holder_height*/]);
            rotate([0,0,end_degree-90])cube([outer_radius, outer_radius, 15/*holder_height*/]);
        }
        cylinder(h=15/*holder_height*/,r1=outer_radius,r2=outer_radius,center=false,$fn=300);
    }
}
module holder_slice(start_degree, end_degree){
    intersection(){
        complete_support();
        120deg_cut(start_degree, end_degree);
    }
}


module holder_connect_outer_full(){
    difference(){
        cylinder(h=holder_attach_height, r1=outer_radius+holder_attach_thickness, r2=outer_radius+holder_attach_thickness, center=false, $fn=300);
        cylinder(h=holder_attach_height, r1=outer_radius, r2=outer_radius, center=false, $fn=300);
    }
}
module holder_connect_outer_cut(start_degree, end_degree){
    intersection(){
        holder_connect_outer_full();
        ndegree_cut(start_degree,end_degree);
    }
}
module holder_connect_inner_full(){
    difference(){
        cylinder(h=3, r1=inner_most_radius, r2=inner_most_radius, center=false, $fn=300);
        cylinder(h=3, r1=inner_most_radius-holder_attach_thickness, r2=inner_most_radius-holder_attach_thickness, center=false, $fn=300);  
    }  
}
module holder_connect_inner_cut(start_degree, end_degree){
    intersection(){
        holder_connect_inner_full();
        ndegree_cut(start_degree, end_degree);
    }
}
module ndegree_cut(start_degree, end_degree){// here, end_degree-start_degree < 90
    intersection(){
        intersection(){
            rotate([0,0,start_degree])cube([outer_radius+holder_attach_thickness, outer_radius+holder_attach_thickness, 15/*holder_height*/]);
            rotate([0,0,end_degree-90])cube([outer_radius+holder_attach_thickness, outer_radius+holder_attach_thickness, 15/*holder_height*/]);
        }
        cylinder(h=holder_attach_height, r1=outer_radius+holder_attach_thickness, r2=outer_radius+holder_attach_thickness, center=false, $fn=300);
    }
}

holder_slice(-2,118);
color("orange")holder_slice(118,238);
color("cyan")holder_slice(237,357);

holder_connect_outer_cut(-8,4);
holder_connect_inner_cut(-8,4);

holder_connect_outer_cut(112,124);
holder_connect_inner_cut(112,124);

holder_connect_outer_cut(231,243);
holder_connect_inner_cut(231,243);