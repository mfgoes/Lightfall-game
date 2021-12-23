 //general gravity
if global.game_paused
{
	exit;
}

//set target
if instance_exists(oPlayer) target = oPlayer; else {
		hsp = 0;
		target = id; 
}

VerticalCollision(); //gravity
grounded = (place_meeting(x,y+1,oWall) or place_meeting(x,y+1,oParPlatform));

//destroy if outside room + fallen
if y > room_height {
	hp = 0;
}

/*
var grv = 0.3;
vsp = vsp + grv;
if (place_meeting(x,y+vsp, oWall)) or (place_meeting(x,y+vsp, oWallEnemies)) or (place_meeting(x,y+vsp,oParPlatform))
{
	vsp = 0;	
}
y = round(y + vsp);
*/