/// @description Insert description here
var targetX = follow.x - (camW)/2;
var targetY = follow.y - (camH)/2;
targetX = clamp(targetX, 0, room_width - (camW + camDist));
targetY = clamp(targetY, 0, room_height - (camH + camDist*RES_RATIO));

//set debug
draw_sprite_ext(sprite_index,0,x-16,y-16,1,1,0,c_white,0.3);

//GMLive
//if (live_call()) return live_result; 

