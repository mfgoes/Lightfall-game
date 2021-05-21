/// @description Control Menu
//Keyboard Controls
var i = menu_cursor;
with oButton
{
	color = make_color_rgb(115, 120, 119);
	if (index == i) color = make_color_rgb(115, 209, 204);
}
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
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
		
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor <0) menu_cursor = menu_items-1;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);	//0 = for if there's multiple mice implemented
	var mouse_x_gui = device_mouse_x_to_gui(0);
	
	if mouse_y_gui > menu_top && mouse_y_gui < menu_y
	{
		var instance = instance_position(mouse_x_gui, mouse_y_gui, oButton);
		if instance
		{
			menu_cursor = instance.index;
			with instance color = make_color_rgb(115, 209, 204);
		}
		else menu_cursor = (menu_y - mouse_y_gui) div (menu_item_height * gui_mult);
	}
	if (mouse_check_button_pressed(mb_left)) || (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+20;
		menu_committed = menu_cursor;
		audio_sound_gain(snJump1,0.2,0);
		audio_play_sound(snJump1,5,0);
		//ScreenShake(4,10);
		menu_control = false;		
	}
}

//menu_committed = menu_cursor;
if (menu_committed != -1) //&& (menu_x > gui_width+150) &&
{
	switch (menu_committed)
	{
		case 2:
		global.sound_volume = min(1, global.sound_volume + 0.1);
		audio_master_gain(global.sound_volume);
		menu_committed = -1;
		menu_control = true;
		break;
		case 1:
		global.sound_volume = max(0, global.sound_volume - 0.1);
		audio_master_gain(global.sound_volume);
		menu_committed = -1;
		menu_control = true;
		break
		case 0:
		instance_destroy();
		with oGame pause_menu = instance_create_layer(0, 0, "Player", oPauseMenu);
		break;
		
	}
}

///GUI items ease in
//menu_x +=(menu_x_target - menu_x) / menu_speed;
