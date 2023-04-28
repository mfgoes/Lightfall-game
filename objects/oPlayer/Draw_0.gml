/// @description character animations


draw_set_color(c_white);
if (state == PlayerStateSwing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);

#region draw character 
	var flip_image =  sign(dcos(facing_direction)) * 0.9 + dcos(facing_direction)*0.1;
	if flip_image = 0 flip_image = 1;
	draw_sprite_ext(sprite_index,image_index,x,y,flip_image,1,image_angle,c_white,1);
	effect_flash();
#endregion



//debug visual

