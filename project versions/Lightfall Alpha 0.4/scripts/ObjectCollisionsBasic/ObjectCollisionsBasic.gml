// Script assets have changed for v2.3.0 see
// this is for basic objects / boxes. May be expanded in the future to enemies. 
//It's a lot simpler than player collisions (keep it seperate). 
function VerticalCollision(){
	 
if (place_meeting(x,y+vsp, oWall)) || (place_meeting(x,y+vsp, oParPlatform))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp); 
	}
	vsp = 0;
	
}
y = round(y + vsp);
}


//reusable vertical collisions (for enemies)
