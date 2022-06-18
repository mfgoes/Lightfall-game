/// @description character animations

//gm live 
//if (live_call()) return live_result; 

draw_set_color(c_white);
if (state == PlayerStateSwing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);

#region draw character 

	var flip_image = dcos(facing_direction);
	draw_sprite_ext(sprite_index,image_index,x,y,flip_image,1,image_angle,c_white,1);

#endregion

//flash when hit
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 
