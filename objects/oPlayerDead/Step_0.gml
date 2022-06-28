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
			done = 1;
			image_index = 1;
			alarm[0] = 20;
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
