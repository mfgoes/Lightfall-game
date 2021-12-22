/// @description Insert description here
// You can write your code in this editor
image_blend = start_color;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,1);

if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 

