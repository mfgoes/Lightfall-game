// Script assets have changed for v2.3.0 see

// basic flash (ie when getting hit by something)
function effect_flash(){
	if (flash > 0) 
	{
		flash --;
		if (shader_is_compiled(shWhite)) shader_set(shWhite);
		draw_sprite(sprite_index,image_index,x,y);
		shader_reset();
	} 
}