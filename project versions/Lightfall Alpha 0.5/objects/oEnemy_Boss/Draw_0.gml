/// @description Insert description here
if (CheckInCamera()) {
	
	var anim_x_new = -sign(x - target.x)*atk_anim_x;
	draw_sprite_ext(sprite_index,image_index,x+anim_x_new,y,image_xscale,image_yscale,0,c_white,1);
	if (flash > 0) 
	{
		flash --;
		shader_set(shWhite);
		draw_self();
		shader_reset();
	} 
}

if image_alpha <1 image_alpha+=0.025;

