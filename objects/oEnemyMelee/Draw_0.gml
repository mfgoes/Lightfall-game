/// @description Insert description here
draw_sprite_ext(sprite_index,image_index,x+atk_anim_x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
if (flash > 0) 
{
	flash --;
	gpu_set_fog(1,c_white,1,1)
	draw_self();
	gpu_set_fog(0,c_white,1,1)
} 
if image_alpha <1 image_alpha+=0.025;


//quick debug. Delete later
/*
draw_set_font(fSign);
draw_text(x,y-30,timer_get("leap_timer"));
draw_set_color(c_blue);
draw_text(x,y-40,"h: " + string(h_leap));
draw_text(x,y-50,"vsp: " + string(vsp));
draw_set_color(c_white);
*/
