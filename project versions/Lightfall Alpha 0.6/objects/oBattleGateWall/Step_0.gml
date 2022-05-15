/// @description push away player
event_inherited();

if place_meeting(x,y,oPlayer) {
	if !place_meeting(oPlayer.x+dir,y,oWall) oPlayer.x += dir;
	
	if (global.wavetotal - global.killsthiswave > 0) {
		if !place_meeting(oPlayer.x+dir,y,oWall)
			oPlayer.x += dir;
	}
}