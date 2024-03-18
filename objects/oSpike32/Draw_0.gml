/// @desc dfdf
if alarm[0] > 0 rot = 0; 
else
rot+=5; 

if rot >= 360 rot = 0; 
draw_sprite_ext(sprite_index,0,x,y,1,1,rot,c_white,1);
effect_flash();