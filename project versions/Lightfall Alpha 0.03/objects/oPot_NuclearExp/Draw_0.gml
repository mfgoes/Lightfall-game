/// @description Insert description here

draw_sprite(sprite_index,image_index,x,y);
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_sprite(sprite_index,image_index,x,y);
	shader_reset();
} 