/// @description spawn enemmy
instance_create_depth(x,y,depth,spawn_type);
audio_sound_gain(snSpawnGeneric,0.3,0);
audio_play_sound(snSpawnGeneric,0,0);

repeat(4) {
	with(instance_create_layer(x,bbox_bottom,"Player",oDust)) {
		vsp = random_range(-2,2)
		hsp = random_range(-2,2)
		image_xscale = choose (1,-1);
		image_yscale = choose (1,-1);
	}	
}		
instance_destroy();
