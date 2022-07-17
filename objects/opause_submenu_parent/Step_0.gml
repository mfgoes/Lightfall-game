/// @description Submenu action

//restart game
if keyboard_check_released(ord("R")) {
	audio_ui_click(); 
	SlideTransition(TRANS_MODE.RESTART);
}

if alarm[0] <= 0 {
	if mouse_check_button_pressed(mb_left) or keyboard_check_released(ord("B")){
		audio_ui_click(); 
		instance_destroy();
		with oGame pause_menu = instance_create_depth(0, 0, depth, oPauseMenu);
	}
}