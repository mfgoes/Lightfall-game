/// @description generate items for room
/*This object is in charge of effects including:
	-Creating the enemy spawner
	
	-Wind
	-Particles
	-Blur
*/

//spawner
instance_create_layer(x,y,"Enemies",oEnemySpawner);

//particles
if !instance_exists(oParticleFog) { //make global setting for particles later
	instance_create_depth(0,0,depth,oParticleFog);
}
if !instance_exists(oParticleSnow) {
	instance_create_depth(0,0,depth,oParticleSnow);
}



//Wind effect
grass_global_dir = 0;
grass_dir = 1; //right, then left