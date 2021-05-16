/// @desc destroy self (inherit this code from parent enemy)
if global.game_paused
{
	exit;
}

if (hp <= 0) 
{
	
	ScreenShake(3,5);
	audio_sound_gain(snFootstep3,0.5,0);
	audio_play_sound(snFootstep3,10,false);

	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	if (instance_exists(oPlayer)) {
	global.kills++;	
	global.killsthisroom++;
	with(oGame) killtextscale = 2;
	}
	instance_destroy();
}
