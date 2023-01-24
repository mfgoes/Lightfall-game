/// @description Insert description here
// You can write your code in this editor
repeat(3)
{
	//dust particles
	with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
		vsp = -0.1; image_alpha = 0.5+random(0.3);
		hsp = random_range(-1,1);
		image_xscale = choose (2,-2);
		image_yscale = choose (2,-2);
	}
}
	
//make sound depending on the sprite image. this is the "type" of this bullet (for now)
if sprite_index = sEBullet_Mage {
	audio_play_sound(snElectric_Hit,0,0,global.sound_volume*0.1);
}
	
instance_destroy();
