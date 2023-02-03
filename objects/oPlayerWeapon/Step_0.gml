/// @description angle weapon
#region set weapon pos + visibility
	x = oPlayer.x - lengthdir_x(3,oPlayer.facing_direction) - lengthdir_x(weapon_recoil,image_angle);
	y = oPlayer.y;
#endregion

#region angle weapon
		
	//change angle (regular)	
	if oPlayer.key_primary or oPlayer.key_secondary or oPlayer.key_primary_released {
		var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));	
		if mouse_angle < 90 or mouse_angle > 270 {
			if aim_360 = true 
				image_angle = mouse_angle; 
			else
				image_angle = 0; 
		}
		else { 
			if aim_360 = true 
				image_angle = mouse_angle;
			else
				image_angle = 180; 	
		}
	} //else image_angle = oPlayer.facing_direction;
	
	//set image angle for player if using mouse
	if mouse_check_button(mb_left) or mouse_check_button(mb_right) oPlayer.facing_direction = image_angle;
#endregion
