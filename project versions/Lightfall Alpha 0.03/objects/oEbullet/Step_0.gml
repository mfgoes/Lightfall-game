/// @description Insert description here
x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);


	
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


//hit player
if (place_meeting(x,y,oPlayer)) 
{
	with(instance_place(x,y,oPlayer))
	{
		hp-=other.damage;
		flash = 3;
		hitfrom = other.direction;
		ScreenShake(2,20);
		
		if hp < 1 KillPlayer();
	}
	instance_destroy();
}
	