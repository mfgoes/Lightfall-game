/// @description effects + drop items
//dust particles
with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
	vsp = -0.1; image_alpha = 0.3+random(0.3);
}

//drops
DropAmmoOrHealth(0.5,1,0.5); 

//create a visual for 'destroyed crate' 