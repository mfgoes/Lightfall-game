/// @description character animations

//gm live 
if (live_call()) return live_result; 

/*laser line (make this blocked by walls later
	gpu_set_blendmode(bm_add);
	draw_set_alpha(0.2);
	var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));
	draw_line_width_color(x,y,x+lengthdir_x(120,mouse_angle),y+lengthdir_y(150,mouse_angle),1,c_red,c_black);
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
*/	


draw_set_color(c_white);
if (state == PlayerStateSwing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);
#region draw character 

	//flip character when shooting
	var flip_image = 1;
	if oPlayerWeapon.image_alpha > 0 //if using weapon
	{
		if (key_primary or key_secondary or key_special or key_roll) {
			flip_image = oPlayerWeapon.flip_weapon;
			facing_direction = radtodeg(arccos(oPlayerWeapon.flip_weapon));	
		}
	}
	if hsp = 0 && mouse_check_button(mb_left) = true {
			sprite_index = spriteAim; 
			image_speed = 0;
	}
	//else flip_image = dcos(facing_direction);
	else //if no weapons (ie in shops) 
	{
		flip_image = dcos(facing_direction);
	}
	
	//draw_text(x-24,y-24,"facing_direction: " + string(facing_direction));
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

