/// @desc collisions 
/// @desc collisions 
if place_meeting(x,y,oPlayer) {
	var xDist = (x - oPlayer.x)
	var flattenAmount = .1;
	xVar = xDist*0.5;
	yVar = xDist * flattenAmount;   	
}

//wind
direction+=0.03;
grass_global_dir = cos(direction)*0.5;
xVar += grass_global_dir;