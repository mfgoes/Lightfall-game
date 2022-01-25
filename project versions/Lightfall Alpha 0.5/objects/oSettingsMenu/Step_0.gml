/// @description Menu settings



//Inherit this stuff
//restart game
if keyboard_check_released(ord("R")) {
	audio_ui_click(); 
	SlideTransition(TRANS_MODE.RESTART);
}

if (live_call()) return live_result; 

//display volume as it changes
menu[0] = "Volume: " + string(round(global.sound_volume*100)); //easy lerp this


//move around buttons
var xx = display_get_gui_width()/2 * resolution; 
var key_left = keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A")) || gamepad_button_check(0,gp_padl);
var	key_right = keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D")) || gamepad_button_check(0,gp_padr);
BL.y = menu_y_top * resolution + (line_height*0);
BL.x = (xx - m);
BR.x = (xx + m);
BR.y = BL.y; 

//Keyboard Controls (ignore for now)
if (menu_control) 
	{
		//click on selected item
		if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
		{
			menu_committed = menu_move;
		}
		
		#region keypad controls
			if (keyboard_check_pressed(vk_down))
			{
				menu_move++;
				if (menu_move >= menu_index) menu_move = 0;
			}
		
			if (keyboard_check_pressed(vk_up))
			{
				menu_move--;
				if (menu_move <0) menu_move = menu_index-1;
			}
	
			var mouse_y_gui = (device_mouse_y_to_gui(0)); 
		
			if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) { //can also use clamp function
				menu_move = (mouse_y_gui - menu_y_top) div (line_height/resolution);	
			} else exit;
			
			//hardcoded control for now:
			if (key_left) {
				global.sound_volume = max(0, global.sound_volume - 0.1);
				audio_master_gain(global.sound_volume);
				audio_ui_click(); 
			}
			if (key_right) {
				global.sound_volume = min(1, global.sound_volume + 0.1);
				audio_master_gain(global.sound_volume);
				audio_ui_click(); 
			}
			
		#endregion
	
}

//mouse control;
if (menu_committed != -1) //&& (menu_x > gui_width+150) &&
{
	switch (menu_committed)
	{
		case 0: //volume global
			if BL_hover && mouse_check_button_pressed(mb_left) {
				global.sound_volume = max(0, global.sound_volume - 0.1);
				audio_master_gain(global.sound_volume);
				audio_ui_click(); 
			}
			if BR_hover && mouse_check_button_pressed(mb_left) {
				global.sound_volume = min(1, global.sound_volume + 0.1);
				audio_master_gain(global.sound_volume);
				audio_ui_click(); 
			}
			
			break;		
		case 1: //back button
			audio_ui_click(); 
			instance_destroy();
			with oGame pause_menu = instance_create_layer(0, 0, "Player", oPauseMenu);
			break;
	}
}
