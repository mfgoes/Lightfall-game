/// @description Control Menu

//To do: scrap this completely and replace with parent menu code. 

var key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var key_confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

//mouse input
var mouse_y_gui = (device_mouse_y_to_gui(0)); 
if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) { //can also use clamp function
	menu_move = (mouse_y_gui - menu_y_top) div (button_h/resolution);	
	//if menu_move_current != menu_move { //make click sound
	//	menu_move_current = menu_move;
	//	audio_ui_click(1); 
	//}
	last_selected = menu_index;
}	
//keys input
else { 
	menu_move = key_down - key_up;
	if (menu_index < 0) menu_index = buttons-1; 
	if (menu_index > buttons - 1) menu_index = 0;
	menu_index+= menu_move;
	
	if (menu_index != last_selected) audio_ui_click(1); 
	last_selected = menu_index;
	//to do: apply this to all menus
}

/// @description Confirm button
if (key_confirm) {
		
	switch (menu_index) {
		case 1: //new game
			show_debug_message("PRESS: NEW GAME");
			audio_ui_click(2); 
			SlideTransition(TRANS_MODE.GOTO,rLevel1); 
			break;
		
		case 0: //load game
			
			if global.HTML_config = 1 {
				show_debug_message("PRESS: NEW GAME");
				audio_ui_click(2); 
				SlideTransition(TRANS_MODE.GOTO,rLevel1); 
			}
			else {
				
				show_debug_message("PRESS: NEW GAME");
				if (!file_exists(SAVEFILE)) {
						SlideTransition(TRANS_MODE.NEXT);	
				} //make it impossible to save on the main room, otherwise it loops. 
				//TO DO: make sure last save isn't on main menu (otherwise this loops badly)
				else {
						var file = file_text_open_read(SAVEFILE);
						var target = file_text_read_real(file);
						global.kills = file_text_read_real(file);
						global.hasgun = file_text_read_real(file);
						global.exp_points = file_text_read_real(file);
						file_text_close(file);
						SlideTransition(TRANS_MODE.GOTO,target);
				}
			}
			break;
		
		case 2: //options
			show_debug_message("PRESS: LEVEL SELECT");
			audio_ui_click(0); 
			SlideTransition(TRANS_MODE.GOTO,rLevelSelect); 
			break;		
		case 3: //end game
			show_debug_message("PRESS: QUIT");
			audio_ui_click(0);
			break;		
	}
}
/*
if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
{
	menu_x_target = gui_width+20;
	menu_committed = menu_move;
	audio_ui_click(); 
	//menu_control = false;		
}
*/

