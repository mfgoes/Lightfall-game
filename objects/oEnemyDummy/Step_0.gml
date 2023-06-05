event_inherited();

/// @description Insert description here

if (hp <= 0) 
{
	instance_destroy();
	
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.7+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		
	}
	audio_play_sound(statue_stomp_02,2,0);
	instance_destroy();
}
