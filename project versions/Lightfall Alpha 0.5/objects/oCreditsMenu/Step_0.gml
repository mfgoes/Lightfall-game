/// @description Control Menu
//Keyboard Controls
if (menu_control) 
{
	//restart game
	if keyboard_check_released(ord("R"))
		SlideTransition(TRANS_MODE.RESTART);
	
	if (keyboard_check_pressed(vk_up))
		menu_move++;
		if (menu_move >= menu_index) menu_move = 0;
		
	if (keyboard_check_pressed(vk_down))
		menu_move --;
		if (menu_move <0) menu_move = menu_index-1;
	

	var mouse_y_gui = device_mouse_y_to_gui(0);	//0 = for if there's multiple mice implemented

	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top) 
	{
		menu_move = (menu_y - mouse_y_gui) div (menu_item_height * gui_mult);
	}


	if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+20;
		menu_committed = menu_move;
		audio_ui_click(); 
		//ScreenShake(4,10);
		menu_control = false;		
	}
}

//menu_committed = menu_move;
if (menu_committed != -1) //&& (menu_x > gui_width+150) &&
{
	switch (menu_committed)
	{
		case 0:
		instance_destroy();
		with oGame pause_menu = instance_create_layer(0, 0, "Player", oPauseMenu);
		break;
		
	}
}