/// @description Insert description here
// You can write your code in this editor
image_blend = start_color;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,1);

if (flash > 0) 
{
	flash --;
	gpu_set_fog(1,c_white,1,1)
	draw_self();
	gpu_set_fog(0,c_white,1,1)
} 

