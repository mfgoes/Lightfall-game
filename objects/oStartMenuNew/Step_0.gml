/// @description Control Menu
if (live_call()) return live_result;

#region hover over link
	if (menu_control)  && alarm[0] <= 0 
	{
		//restart game
		if keyboard_check_released(ord("R"))
		SlideTransition(TRANS_MODE.RESTART);
	
		#region select links
	
			//draw_rectangle(RES_W/2-50,menu_y_top-5,RES_W/2+50,menu_y_bot,0);
			//mouse input
			var mouse_x_gui = (device_mouse_x_to_gui(0)); 
			var mouse_y_gui = (device_mouse_y_to_gui(0)); 
			if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top)
			&& (mouse_x_gui > RES_W/2-50) && (mouse_x_gui < RES_W/2+50) 
			{ //can also use clamp function
				menu_move = (mouse_y_gui - menu_y_top) div (line_height/resolution);	
				if menu_move_current != menu_move { //make click sound
					menu_move_current = menu_move;
					audio_ui_click(1); 
				}
			} else if (mouse_x_gui < RES_W-80) {
			//keys input if not trying to click somewhere else
				if (keyboard_check_pressed(vk_down))
				{
					menu_move++;
					if (menu_move >= menu_index) menu_move = 0;
					audio_ui_click(1); 
				}
		
				if (keyboard_check_pressed(vk_up))
				{
					menu_move--;
					if (menu_move <0) menu_move = menu_index-1;
					audio_ui_click(1); 
				}	
			} else 
				menu_move = -1; //unselected
			}
			
			
			{ 
			
		#endregion
	if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
		{
			menu_x_target = gui_width+20;
			menu_committed = menu_move;
			audio_ui_click(); 
			//menu_control = false;		
		}
	}
#endregion


#region select link
	if (menu_committed != -1)
	{
	
		switch (menu_committed)
		{
		
			case 0: //lvl 1
				show_debug_message("New game");
				SlideTransition(TRANS_MODE.GOTO,rLevel1);
				break;
			case 1: //lvl 2
				show_debug_message("Load game");
				if global.HTML_config = 1 {
				show_debug_message("HTML save disabled. Loading new game.");
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
				menu_committed = -1;
				break;
			case 2: //lvl 3
				show_debug_message("Level Select");
				audio_ui_click(0); 
				SlideTransition(TRANS_MODE.GOTO,rLevelSelect); 
				menu_committed = -1;
				break;
			case 3: //lvl 4
				show_debug_message("Fullscreen");
				window_set_fullscreen(!window_get_fullscreen());
				menu_committed = -1;
				break;
			case 4: //lvl 5
				show_debug_message("Quit game");
				game_end(); 
				//SlideTransition(TRANS_MODE.GOTO,rLevel1);
				menu_committed = -1;
				break;

		}
	}
#endregion