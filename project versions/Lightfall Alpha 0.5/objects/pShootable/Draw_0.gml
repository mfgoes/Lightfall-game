/// @description Insert description here
if (CheckInCamera()) {
	
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
	if (flash > 0) 
	{
		flash --;
		shader_set(shWhite);
		draw_self();
		shader_reset();
	} 
}