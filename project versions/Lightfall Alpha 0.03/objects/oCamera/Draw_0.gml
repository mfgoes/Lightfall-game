/// @description Insert description here
var targetX = follow.x - (camW)/2;
var targetY = follow.y - (camH)/2;

targetX = clamp(targetX, 0, room_width - (camW + camDist));
targetY = clamp(targetY, 0, room_height - (camH + camDist*RES_RATIO));
		
draw_circle_color(targetX,targetY,20,c_white,c_white,1);
