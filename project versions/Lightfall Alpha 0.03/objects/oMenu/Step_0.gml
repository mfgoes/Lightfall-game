/// @description Control Menu
//Keyboard Controls
if (menu_control) 
{
	//restart game
	if keyboard_check_released(ord("R"))
	SlideTransition(TRANS_MODE.RESTART);
	
	/*go to next room 
	if keyboard_check(vk_enter) && menu_cursor = 2 { //check if correct menu item here
		room_goto_next();
	}*/

	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor ++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
		
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor --;
		if (menu_cursor <0) menu_cursor = menu_items-1;
	}
	

	var mouse_y_gui = device_mouse_y_to_gui(0);	//0 = for if there's multiple mice implemented

	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) 
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_item_height * 1.5); 	
	}
	
	if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+20;
		menu_committed = menu_cursor;
		audio_sound_gain(snLanding,0.2,0);
		audio_play_sound(snLanding,5,0);
		//ScreenShake(4,10);
		menu_control = false;		
	}
}

//menu_committed = menu_cursor;
if (menu_committed != -1) //&& (menu_x > gui_width+150) &&
{
	switch (menu_committed)
	{
		case 2: SlideTransition(TRANS_MODE.NEXT); break;	//new game
		case 1: 
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT);	
			}
			else
			{
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
		case 0: game_end(); break;
		
	}
}

///GUI items ease in
menu_x +=(menu_x_target - menu_x) / menu_speed;
