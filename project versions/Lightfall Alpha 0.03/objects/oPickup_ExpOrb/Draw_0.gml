/// @description flash when appearing
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 
else
draw_self();