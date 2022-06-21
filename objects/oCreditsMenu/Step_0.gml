/// @description Menu settings

//restart game
if keyboard_check_released(ord("R")) {
	audio_ui_click(); 
	SlideTransition(TRANS_MODE.RESTART);
}

//INHERIT THIS LATER

//basic back button everywhere
if mouse_check_button_pressed(mb_left) {
	audio_ui_click(); 
	instance_destroy();
	with oGame pause_menu = instance_create_layer(0, 0, "Player", oPauseMenu);	
}