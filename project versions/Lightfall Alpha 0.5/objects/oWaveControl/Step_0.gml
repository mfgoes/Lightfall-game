/// @desc move through grid
spawn = grid_wave[# grid_x, grid_y];

//trigger wave (test)
if keyboard_check_pressed(vk_up) { 
	if wave_active = false {
		alarm[0] = 20; 
		wave_active = true;
	}
}