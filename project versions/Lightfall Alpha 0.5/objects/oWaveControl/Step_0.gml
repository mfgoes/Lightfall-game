/// @desc move through grid
//trigger wave (test)
if keyboard_check_pressed(vk_up) or place_meeting(x,y,oPlayer) { 
	if wave_active = false {
		alarm[0] = 20; 
		wave_active = true;
	}
}