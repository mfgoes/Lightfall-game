/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result; 
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,1);



if (global.debugmode) {
	draw_text(xstart,ystart-30,"dir: " + string(dir));
	draw_line(x,y,xstart,ystart);
}
