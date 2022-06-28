/// @description Insert description here
if global.game_paused
{
	exit;
}

if (done = 0) 
{
	vsp = vsp + grv; 

	//Horizontal collision
	if (place_meeting(x+hsp,y, oWallParent))
	{
		while (!place_meeting(x+sign(hsp),y,oWallParent))
		{
			x = x + sign(hsp); 
		}
		hsp = 0;
	
	}
	x = x + hsp;


	//Vertical collision
	if (place_meeting(x,y+vsp, oWallParent))
	{
		
		if (vsp > 0) 
		{
			if image_number = 2 //if a 2 image death animation, change to last frame
				image_index = 1;
			hsp = 0;
		}
		while (!place_meeting(x,y+sign(vsp),oWallParent))
		{
			y = y + sign(vsp); 
		}
		vsp = 0;
	
	}
	y = y + vsp;
}

//destroy if no more flash
if flash = 0 {
	repeat(5)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,y,"Bullets",oDust)) {
			vsp = -0.15; image_alpha = 1;
			hsp = random_range(-2,2)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+2-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	instance_destroy();
	}
