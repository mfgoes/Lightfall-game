/// @description Control Menu
//Keyboard Controls
if (menu_control)  && alarm[0] <= 0 
{
	//restart game
	if keyboard_check_released(ord("R"))
	SlideTransition(TRANS_MODE.RESTART);
	
	#region select links
		var mouse_y_gui = (device_mouse_y_to_gui(0)); 
		
		if (mouse_y_gui < menu_y_bot) && (mouse_y_gui > menu_y_top) { //can also use clamp function
			menu_move = (mouse_y_gui - menu_y_top) div (line_height/resolution);	
		}
		else { 
			//key controls
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


if (menu_committed != -1)
{
	
	switch (menu_committed)
	{
		
		case 0: //lvl 1
			SlideTransition(TRANS_MODE.GOTO,rLevel1);
			break
		case 1: //lvl 2
			SlideTransition(TRANS_MODE.GOTO,rLevel2);
			break;
		case 2: //lvl 3
			SlideTransition(TRANS_MODE.GOTO,rLevel3);
			break;
		case 3: //lvl 4
			SlideTransition(TRANS_MODE.GOTO,rLevel1);
			break;
		case 4: //lvl 5
			SlideTransition(TRANS_MODE.GOTO,rLevel1);
		break;
		case 5: //back to previous menu
			room_goto(rMenu);
	}
}
