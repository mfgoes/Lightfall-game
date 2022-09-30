/// @description Insert description here
if global.game_paused
{
	exit;
}

x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);


if collision_wall
{
	if (place_meeting(x,y,oWall)) && (image_index !=0) 
	{
		while (place_meeting(x,y,oWall)) 
		{
			x-= lengthdir_x(1,direction);	//move back in direction
			y-= lengthdir_y(1,direction);
		}
		spd = 0;
		instance_change(oHitSpark,true);
	}
}


//hit player
if (place_meeting(x,y,oPlayer)) 
{
	with(instance_place(x,y,oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		hitfrom = other.direction;
		gunkickx = cos(degtorad(other.direction))*6;
		ScreenShake(3,20);
		
		if hp < 1 KillPlayer();
	}
	instance_destroy();
}

if destroy_self
{
	instance_destroy();
}
