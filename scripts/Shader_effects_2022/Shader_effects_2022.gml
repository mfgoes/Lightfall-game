// Script assets have changed for v2.3.0 see

// basic flash (ie when getting hit by something)
function effect_flash(){
	if (flash > 0) 
	{
		flash --;
		if (shader_is_compiled(shWhite)) shader_set(shWhite);
		draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);
		shader_reset();
	} 
}