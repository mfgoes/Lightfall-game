/// @description 
x+= lengthdir_x(spd,direction);
y+= lengthdir_y(spd,direction);


if g < 120 {
	g += 0.2;
}
y+= g;
image_angle = point_direction(xprevious,yprevious,x,y);


if (place_meeting(x,y,pShootable))
{
	with(instance_place(x,y,pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}
	
if (place_meeting(x,y,oWall)) && (image_index !=0) 
{
	spd = 0;
	instance_change(oHitSpark,true);
}
