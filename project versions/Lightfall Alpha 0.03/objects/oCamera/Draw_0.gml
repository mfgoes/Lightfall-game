/// @description Insert description here
var targetX = follow.x - (camW)/2;
var targetY = follow.y - (camH)/2;
targetX = clamp(targetX, 0, room_width - (camW + camDist));
targetY = clamp(targetY, 0, room_height - (camH + camDist*RES_RATIO));

//GMLive
//if (live_call()) return live_result; 

