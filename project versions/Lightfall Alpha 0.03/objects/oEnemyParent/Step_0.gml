 //general gravity
if global.game_paused
{
	exit;
}

vsp = vsp + grv; 
if (place_meeting(x,y+vsp, oWall)) or (place_meeting(x,y+vsp, oWallEnemies))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp); 
	}
	vsp = 0;	
}
y = round(y + vsp);