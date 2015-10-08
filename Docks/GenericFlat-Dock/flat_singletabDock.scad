module singleTabDock()
{
	intersection() {
		difference() {
			union() {
				cube([60, 30, 10]);
				//translate([0, 0, -5])
				//	cube([15, 15, 10]);

			}
			union() {
				// Main front top cutout - Part A - Outer
                       translate([-10,5,-5]) 
				  cube([57, 21, 10]);
				// Main front top cutout - Part B - Inner
                       translate([-10,7.5,-5]) 
				  cube([46, 16, 12]);

				// Decorational cutout
                //  translate([0,0,-3]) 
				//  cube([20, 30, 5]);

				// Tab cutout
                       translate([-10,10,-5]) 
				  cube([65, 10, 7]);

				// Connector slot
                translate([45,6,2.5]) 
				  cube([10, 2.54*2, 8]);
                translate([45,19,2.5]) 
				  cube([10, 2.54*2, 8]);

				// Main Screw hole
                translate([50,15,0]) 
				  cylinder(r = 1.5, h = 10);

				// Wiring Cavity
                translate([50,5,6]) 
				  cube([15, 20, 4]);

				// Additional cutout for mounting backplate
                       translate([30,5,8]) 
				  cube([15, 20, 2]);

				// Backplate Screw hole 1
                       translate([52.50,7.5,2]) 
				  cylinder(r = 1, h = 8);

				// Backplate Screw hole 2
                       translate([52.50,22,2]) 
				  cylinder(r = 1, h = 8);

 				// Rear wire Hole
                       	translate([50,15,7]) 
					rotate([0,90,0])
						cylinder(r=2, h= 10);

			}
		}
              
	//	translate([0, 0, 25])
	//		cylinder(h = 51, r1 = 20, r2 = 5, center = true);
//                 cube([60, 30, 30], center = true);



	}
}

module backPlate(){

				// Wiring Cavity
                       translate([40,35,6]) 
				  cube([15 - 0.5, 20 - 0.5, 4]);

				// Additional cutout for mounting backplate
                       translate([30,35,8]) 
				  cube([14.5, 19.5, 2]);

				// Backplate Screw hole 1
                       translate([52.50,37.5,2]) 
				  cylinder(r = 1, h = 8);

				// Backplate Screw hole 2
                       translate([52.50,52,2]) 
				  cylinder(r = 1, h = 8);


}

singleTabDock();

backPlate();

