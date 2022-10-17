//@desc generate particles/effects per room

//Note: Effects and backgrounds should be dependent on device type and framerate. 

/*

*/
//draw particles

global.partSystem = part_system_create();
part_system_depth(global.partSystem, -100);

if !(global.HTML_config) {	//no fog on html version
	if !instance_exists(oParticleFog) { //make global setting for particles later
		instance_create_depth(0,0,depth,oParticleFog);
	} else instance_destroy(); 
}

if !instance_exists(oParticleSnow) {
	instance_create_depth(0,0,depth,oParticleSnow);
} else instance_destroy(); 

//draw parallax
if !instance_exists(oParallaxBgr) && layer_exists("parallax_bgr") {
	instance_create_layer(0,0,"parallax_bgr",oParallaxBgr);
}


//Wind effect
grass_global_dir = 0;
grass_dir = 1; //right, then left