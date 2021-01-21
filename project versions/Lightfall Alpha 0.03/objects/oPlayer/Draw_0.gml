/// @description character animations

//gm live 
//if (live_call()) return live_result; 

draw_set_color(c_white);
if (state == PlayerStateSwing) draw_line_width(grappleX,grappleY,ropeX,ropeY,2);

#region draw character sprite
	var flip_image = 1;
	if global.hasgun = true  { //if oWeaponPlayer.image_alpha > 0 && mouse_check_button(mb_left) = true 
	{
		flip_image = oWeaponPlayer.flip_weapon;
		facing_direction = radtodeg(arccos(oWeaponPlayer.flip_weapon));	
		
		if hsp = 0 && mouse_check_button(mb_left) = true {
				sprite_index = spriteAim; 
				image_speed = 0;
			}
	}
	//else flip_image = dcos(facing_direction);
	}
	else //if no weapons (ie in shops) 
	{
		flip_image = dcos(facing_direction);
	}
	
	
	//draw_text(x-24,y-24,"facing_direction: " + string(facing_direction));
	draw_sprite_ext(sprite_index,image_index,x,y,flip_image,1,image_angle,c_white,1);
	
	/*
	//animation xscale
	if global.hasgun = true{
		if oWeaponPlayer.image_alpha > 0 { //was: mouse_check_button(mb_left) = true
			//facing_direction = arccos(oWeaponPlayer.image_yscale);
			//image_xscale = oWeaponPlayer.image_yscale;
			if oWeaponPlayer.flip_weapon < 0 {
				facing_direction = 180
			}
			else 
			{
				facing_direction = 0;
				//image_xscale = 1;
			}
		
			if hsp = 0 {
				sprite_index = spriteAim; 
				image_speed = 0;
			}
		}
		else {
			if facing_direction = 0 image_xscale = 1 else image_xscale = -1;
			}
	}
	*/

#endregion





//flash when hit
if (flash > 0) 
{
	flash --;
	shader_set(shWhite);
	draw_self();
	shader_reset();
} 

