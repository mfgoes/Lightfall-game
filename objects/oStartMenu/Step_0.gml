/// @description Control Menu

var key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var key_confirm = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

menu_move = key_down - key_up;

menu_index+= menu_move;
if (menu_index < 0) menu_index = buttons-1; 
if (menu_index > buttons - 1) menu_index = 0;
if (menu_index != last_selected) audio_play_sound(snd_button1,2,false);
last_selected = menu_index;

/// @description Confirm button
if (key_confirm) {
	switch (menu_index) {
		case 0: //new game
			show_debug_message("PRESS: NEW GAME");
			SlideTransition(TRANS_MODE.GOTO,rLevel1); 
			break;
		
		case 1: //load game
			show_debug_message("PRESS: NEW GAME");
			if (!file_exists(SAVEFILE)) {
					SlideTransition(TRANS_MODE.NEXT);	
			}
			else {
					var file = file_text_open_read(SAVEFILE);
					var target = file_text_read_real(file);
					global.kills = file_text_read_real(file);
					global.hasgun = file_text_read_real(file);
					global.exp_points = file_text_read_real(file);
					file_text_close(file);
					SlideTransition(TRANS_MODE.GOTO,target);
			}
			break;
		
		case 2: //options
			show_debug_message("PRESS: OPTIONS");
			break;		
		case 3: //end game
			show_debug_message("PRESS: QUIT");
			break;		
	}
}
//GUI items ease in (ADD LATER)

// fullscreen code 
/*
if keyboard_check_pressed(vk_f1) || keyboard_check_pressed(ord("0"))
   {
   if window_get_fullscreen()
      {
      window_set_fullscreen(false);
      }
   else
      {
      window_set_fullscreen(true);
      }
   }
 */