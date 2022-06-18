/// @description keybinds
#region set weapon pos + visibility
	var shift_y = 0; var shift_x = 0; 
	if sprite_index = sWeaponBow_Placeholder{shift_y = 2; shift_x = 3;} //organize this better later
	
	x = oPlayer.x - lengthdir_x(shift_x,image_angle) - lengthdir_x(weapon_recoil,image_angle);
	y = oPlayer.y + 3 - lengthdir_y(weapon_recoil,image_angle);
	

	
#endregion

#region set angle with mouse if clicking on mouse button
	if oPlayer.key_primary or oPlayer.key_secondary or oPlayer.key_primary_released{
		var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));	
		if mouse_angle < 90 or mouse_angle > 270 {
			image_angle = 0; 
		}
		else { 
			image_angle = 180; 	
		}
		//only change with mouse if mouse input is being used
		if mouse_check_button(mb_left) or mouse_check_button(mb_right) oPlayer.facing_direction = image_angle;
	}
#endregion
