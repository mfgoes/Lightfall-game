//@desc generate particles/effects per room

if !instance_exists(oParticleFog) { //make global setting for particles later
	instance_create_depth(0,0,depth,oParticleFog);
} else instance_destroy(); 

if !instance_exists(oParticleSnow) {
	instance_create_depth(0,0,depth,oParticleSnow);
} else instance_destroy(); 



//Wind effect
grass_global_dir = 0;
grass_dir = 1; //right, then left