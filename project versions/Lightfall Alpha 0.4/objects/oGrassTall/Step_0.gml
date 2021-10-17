/// @desc collisions 
if place_meeting(x,y,oPlayer) {
	var xDist = (x - oPlayer.x)
	var flattenAmount = .2;
	xVar = xDist*0.3;
	yVar = xDist * flattenAmount;   	
}

//wind
direction+=0.03;
grass_global_dir = cos(direction);
xVar += grass_global_dir;