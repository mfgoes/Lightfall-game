/// @description Insert description here
if global.game_paused
{
	exit;
}

if (hp <= 0) 
{
	with (instance_create_layer(x,y,"Enemies",oEnemyCorpse))
	{
		start_color = c_orange;
		direction = other.hitfrom;	
		hsp = lengthdir_x(1,direction);
		//vsp = lengthdir_y(3,direction)-2;
		if (sign(hsp) !=0)
		sprite_index = other.spriteDie;
		image_xscale = sign(hsp) *other.size;
		image_yscale = other.size;
	}
	
	repeat(3)	//create dust effect
	{
		//dust particles
		with(instance_create_layer(x,bbox_bottom,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.3+random(0.3);
			hsp = random_range(-1,1)
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
		//create exp
		with (instance_create_layer(x+random_range(-4,4),bbox_top+1-random(4),"Bullets",oPickup_ExpOrb)) //create exp orb
		{hsp = random_range(-3,3)}
	}
	
	instance_destroy();	
}
