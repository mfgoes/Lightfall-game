/// @description Insert description here
if global.game_paused
{
	exit;
}

if !instance_exists(oPlayer) {
	instance_destroy();		//quick fix	
}

//x+= lengthdir_x(spd,dir);
//y+= lengthdir_y(spd,dir);

//hit player
if (place_meeting(x,y,oPlayer)) 
{
	with(instance_place(x,y,oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		hitfrom = other.direction;
		gunkickx = cos(degtorad(other.direction))*1;
		gunkicky = -2;
		ScreenShake(1,5);
		audio_sound_gain(snHitEnemy,0.4,0);
		audio_play_sound(snHitEnemy,0,0);
		
		if hp < 1 KillPlayer();
		
		//create blood particles
		instance_create_depth(x,y,depth-5,oParticleBlood);
	}
	repeat(3)
	{
		//dust particles
		with(instance_create_layer(x,y,"Bullets",oDust)) {
			vsp = -0.1; image_alpha = 0.5+random(0.3);
			hsp = random_range(-1,1);
			image_xscale = choose (2,-2);
			image_yscale = choose (2,-2);
		}
	}
	instance_destroy(); 
}


if collision_wall
{
	if (place_meeting(x,y,oWallParent)) && (image_index !=0) 
	{
		while (place_meeting(x,y,oWallParent)) 
		{
			x-= lengthdir_x(1,direction);	//move back in direction
			y-= lengthdir_y(1,direction);
		}
		repeat(3)
		{
			//dust particles
			with(instance_create_layer(x,y,"Bullets",oDust)) {
				vsp = -0.1; image_alpha = 0.5+random(0.3);
				hsp = random_range(-1,1);
				image_xscale = choose (2,-2);
				image_yscale = choose (2,-2);
			}
		}
instance_destroy(); 		
		
	}
}


