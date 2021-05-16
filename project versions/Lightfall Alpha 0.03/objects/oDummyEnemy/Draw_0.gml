/// @description Insert description here
//gm live 
//if (live_call()) return live_result; 
//image_blend = make_colour_hsv(155, 225, 249);
draw_self();

if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 