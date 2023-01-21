/// @description Control Menu
if (live_call()) return live_result;

#region hover over link
	if (menu_control)  && alarm[0] <= 0 
	{
		//restart game
		if keyboard_check_released(ord("R"))
		SlideTransition(TRANS_MODE.RESTART);
	
		#region select links
	
			//mouse input
			var mouse_y_gui = (device_mouse_y_to_gui(0)); 
			if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) { //can also use clamp function
				menu_move = (mouse_y_gui - menu_y_top) div (line_height/resolution);	
				if menu_move_current != menu_move { //make click sound
					menu_move_current = menu_move;
					audio_ui_click(1); 
				}
			}
			else { 
			//keys input
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
			}
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
				show_debug_message("Level 1 selected");
				SlideTransition(TRANS_MODE.GOTO,rLevel1);
				break;
			case 1: //lvl 2
				show_debug_message("Level 2 selected");
				//SlideTransition(TRANS_MODE.GOTO,rLevel1);
				menu_committed = -1;
				break;
			case 2: //lvl 3
				show_debug_message("Level 3 selected");
				//SlideTransition(TRANS_MODE.GOTO,rLevel1);
				menu_committed = -1;
				break;
			case 3: //lvl 4
				show_debug_message("Level 4 selected");
				//SlideTransition(TRANS_MODE.GOTO,rLevel1);
				menu_committed = -1;
				break;
			case 4: //lvl 5
				show_debug_message("Level 5 selected");
				//SlideTransition(TRANS_MODE.GOTO,rLevel1);
				menu_committed = -1;
				break;
			case 5: //BACK to previous menu
				room_goto(rMenu);
				show_debug_message("Back to start menu");
				menu_committed = -1;
		}
	}
#endregion