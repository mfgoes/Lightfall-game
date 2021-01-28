/// @desc destroy self (inherit this code from parent enemy)

if (hp <= 0) 
{
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (3,-3);
			image_yscale = choose (3,-3);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	ScreenShake(3,25);
	audio_sound_gain(snDeath,0.3,0);
	audio_play_sound(snDeath,10,false);
	instance_destroy();
	
	
	if (instance_exists(oPlayer)) {
		global.kills++;	
		global.killsthisroom++;
		with(oGame) killtextscale = 2;
	}
}