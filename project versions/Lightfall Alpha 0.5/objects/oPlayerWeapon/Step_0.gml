/// @description keybinds
#region set weapon pos + visibility
	var shift_y = 0; var shift_x = 0; 
	if sprite_index = sWeaponBow_Placeholder{shift_y = 2; shift_x = 3;} //organize this better later
	
	x = oPlayer.x - lengthdir_x(shift_x,image_angle) - lengthdir_x(weapon_recoil,image_angle);
	y = oPlayer.y + 3 - lengthdir_y(weapon_recoil,image_angle);
	
	//SET FACING ANGLE
	var mouse_angle = round(point_direction(x,y,mouse_x,mouse_y));	
	image_angle = round(mouse_angle)
#endregion