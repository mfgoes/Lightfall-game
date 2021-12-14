/// @description destroy self

if (hp <= 0) 
{
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1);
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	
	if (instance_exists(oPlayer)) {
	global.kills++;	//do we still need these? 
	global.killsthisroom++;
	global.killsthiswave++;
	//global.wavetotal--;
	with(oGame) killtextscale = 1.2;
	}
	instance_destroy();
}

