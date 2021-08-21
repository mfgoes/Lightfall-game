/// @description generate items for room
//spawner
instance_create_layer(x,y,"Enemies",oEnemySpawner);

//particles
if !instance_exists(oParticleFog) { //make global setting for particles later
	instance_create_depth(0,0,depth,oParticleFog);
}
if !instance_exists(oParticleSnow) {
	instance_create_depth(0,0,depth,oParticleSnow);
}
