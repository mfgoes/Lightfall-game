/// @description Insert description here
draw_self();
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 