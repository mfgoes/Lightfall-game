/// @description flash when appearing
image_blend = start_color;
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 
else
draw_self();
