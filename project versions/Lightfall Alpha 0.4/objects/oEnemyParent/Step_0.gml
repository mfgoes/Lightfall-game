 //general gravity
if global.game_paused
{
	exit;
}

//VerticalCollision(); //gravity
var grv = 0.3;
vsp = vsp + grv;
if (place_meeting(x,y+vsp, oWall)) or (place_meeting(x,y+vsp, oWallEnemies)) or (place_meeting(x,y+vsp,oParPlatform))
{
	vsp = 0;	
}
y = round(y + vsp);

grounded = (place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oParPlatform));