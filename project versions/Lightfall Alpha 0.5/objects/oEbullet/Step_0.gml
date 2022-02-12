/// @description Insert description here
if global.game_paused
{
	exit;
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
		//gunkickx = cos(degtorad(other.direction))*1;
		//ScreenShake(3,20);
		
		if hp < 1 KillPlayer();
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
	if (place_meeting(x,y,oWall)) && (image_index !=0) 
	{
		while (place_meeting(x,y,oWall)) 
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


