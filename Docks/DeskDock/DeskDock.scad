// -------------------------------------------------------
// Clixx.io Docking Station
//
// (c) 2012 David Lyon
//
// -------------------------------------------------------

////////////////
// Parameters //
////////////////

topDiameter = 74;
bottomDiameter = 86;
depth = 60;
tiltAngle = 20;
cradleThickness = 17.84;
nexusThickness = 13.84;
SPACE_FACTOR  = 0.5;
HDR_2P_WIDTH = (2.54 * 2) + SPACE_FACTOR;
HDR_5P_WIDTH = 13;
HDR_5P_DEPTH = 2.5 + SPACE_FACTOR;
TAB_SOCKET_WIDTH = 10.5;
BOARD_BORDER = 2;

rotationDelta = (nexusThickness * sin(tiltAngle))/2; 

topRadius = topDiameter/2;
bottomRadius = bottomDiameter/2;

// --------------------------------------------------------------
// Basic Cylinder for the docking station                      //
// --------------------------------------------------------------
module baseCylinder() {

    translate(v=[0,0,depth/2]) cylinder(h = depth, r2 = topRadius, r1 = bottomRadius,center = true,$fa = 0.1);

}

// --------------------------------------------------------------
// Dock                                                        //
// --------------------------------------------------------------
module dock() {
    union() {

        // front left and right padding
        rotate(a=[0,-tiltAngle+10,0]) translate(v=[13,-25,15]) cube(size=[18,10,40]);
        rotate(a=[0,-tiltAngle+10,0]) translate(v=[13,15,15]) cube(size=[18,10,40]);
    
        // padding cubes to form the front centre 
        rotate(a=[0,-tiltAngle+10,0]) translate(v=[25,-22,10]) cube(size=[10,44,5]);
        rotate(a=[0,-tiltAngle+10,0]) translate(v=[30,-15,10]) cube(size=[10,30,5]);

        difference() {
            baseCylinder();
            translate(v=[0,0, (depth - cradleHeight) - rotationDelta]) 
                rotate(a=[0,-tiltAngle,0]) galaxyNexus(); //nexusBrick();

             // inside cutout
             translate(v=[0,0,-3]) cylinder(h = depth - 4, r2 = topRadius - 4, r1 = bottomRadius - 5);
      
        }

        translate(v=[0,0,0])translate(v=[0,0, (depth - cradleHeight) - rotationDelta]) 
            rotate(a=[0,-tiltAngle,0]) nexusCradle();
    }
}

module everything() {
  union() {
    difference() {
        dock();

        translate(v=[0,0, (depth - cradleHeight) - rotationDelta]) 
            rotate(a=[0,-tiltAngle,0]) translate(v=[0,0,-7]) plugBrick();
        translate(v=[-38,0,plugPathBrickLength/2]) plugPathBrick();

        // Secondary small front slant cutout
        rotate(a=[0,-tiltAngle-10,0]) translate(v=[33,-20.5+BOARD_BORDER,5]) cube(size=[40-(2*BOARD_BORDER),40-(2*BOARD_BORDER),60]);

        // Connector slots
        rotate(a=[0,-tiltAngle-10,0]) translate(v=[35-2.54,-6.4,-5]) cube(size=[HDR_5P_DEPTH,HDR_5P_WIDTH,25]);
        rotate(a=[0,-tiltAngle-10,0]) translate(v=[35-2.54,2.54*6.5-1.54,-5]) cube(size=[HDR_5P_DEPTH,HDR_2P_WIDTH,25]);
      //  rotate(a=[0,-tiltAngle-10,0]) translate(v=[35-2.54,-2.54*6.5-2.54,-5]) cube(size=[HDR_5P_DEPTH,HDR_2P_WIDTH,25]);

        // Slanted FHS bottom bevel
        rotate(a=[0,20,0]) translate(v=[21,-25,33]) cube(size=[20,50,10]);

        // Front upright LHS and RHS bevel
        rotate(a=[0,-8,15]) translate(v=[22,-44,20]) cube(size=[20,20,40]);
        rotate(a=[0,-8,-15]) translate(v=[22,24,20]) cube(size=[20,20,40]);
            
        // Main large front slant cutout
        rotate(a=[0,-tiltAngle-10,0]) translate(v=[35,-21,5]) cube(size=[40,40.5,60]);

  
    }

    // 3 Front Tabbed Rectangles
    rotate(a=[0,-tiltAngle-10.1,0]) translate(v=[36,-25,0]) cube(size=[3,10,15]);
    rotate(a=[0,-tiltAngle-10.1,0]) translate(v=[36,-5,0]) cube(size=[3,10,15]);
    rotate(a=[0,-tiltAngle-10.1,0]) translate(v=[36,15,0]) cube(size=[3,10,15]);
    // Screwholes

    // 2 screw-to fillers
    difference(){
        rotate(a=[0,-tiltAngle-10.1,0]) translate(v=[33,-20,0]) cube(size=[3,15,15]);
        rotate(a=[0,-tiltAngle-10.1+90,0]) translate(v=[-10,-10,30]) cylinder(r=1, h = 10);
    }
    difference(){
        rotate(a=[0,-tiltAngle-10.1,0]) translate(v=[33,5,0]) cube(size=[3,10,15]);
        rotate(a=[0,-tiltAngle-10.1+90,0]) translate(v=[-10,10,30]) cylinder(r=1, h = 10);
    }

    // Main large front slant cutout facure
    rotate(a=[0,-tiltAngle-10,0]) translate(v=[30,-20,5]) cube(size=[3,40,50]);

    // Small front facure in front of tabs
    rotate(a=[0,-tiltAngle-10,0]) translate(v=[36,-19,0]) cube(size=[3,38,5]);

    // Smaller front filler
    rotate(a=[0,tiltAngle,0]) translate(v=[20,-17,28]) cube(size=[7,34,5]);

   }
}

tY =  68.96; // thickness at base
tX = 20;
tZ = 8;
module slant() {
    translate(v=[0,0,tZ/2+58])rotate(a=[0,-tiltAngle,0]) cube([tX,tY,tZ],center=true);
}

difference() {
    everything();
    slant();    
}
