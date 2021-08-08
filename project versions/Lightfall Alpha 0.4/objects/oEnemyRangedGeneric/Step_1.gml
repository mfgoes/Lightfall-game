/// @description overwrite this with parent code later

if global.game_paused
{
	exit;
}

if (hp <= 0) 
{
	//create corpse if possible
	with (instance_create_layer(x,y,"Enemies",oEnemyCorpse))
	{
		if other.spriteDie = 0
		{
			flash = 10;
			sprite_index = other.sprite_index; 
			image_index = 0; image_speed = 0;
		} else sprite_index = spriteDie; 
		
		direction = other.hitfrom;	
		hsp = lengthdir_x(random(2),direction);
		//vsp = lengthdir_y(2,direction);
		y-=5;
		if (sign(hsp) !=0)
		image_xscale = other.image_xscale*0.75; //skew for dramatic effect
		//image_yscale = other.size;
	}

	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 1;
			hsp = random_range(-1,1)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
		
	//with (mygun) instance_destroy();
	if (instance_exists(oPlayer)) {
	global.kills++;	
	global.killsthisroom++;
	global.killsthiswave++;
	with(oGame) killtextscale = 2;
	}
	instance_destroy();
}
