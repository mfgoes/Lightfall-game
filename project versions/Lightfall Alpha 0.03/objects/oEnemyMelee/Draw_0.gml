/// @description Insert description here
//gm live 
if (live_call()) return live_result; 

//image_blend = make_colour_hsv(155, 225, 249);
draw_self();

draw_text(x-10,y-40,string(stunned));
draw_text(x-10,y-30,x-xprevious);

if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 