/// @description Insert description here
if (done = 0) 
{
	vsp = vsp + grv; 

	//Horizontal collision
	if (place_meeting(x+hsp,y, oWall))
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp); 
		}
		hsp = 0;
	
	}
	x = x + hsp;


	//Vertical collision
	if (place_meeting(x,y+vsp, oWall))
	{
		
		if (vsp > 0) 
		{
			image_index = 1;
			hsp = 0;
		}
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp); 
		}
		vsp = 0;
	
	}
	y = y + vsp;
}
