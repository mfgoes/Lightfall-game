/// @description Control Menu
menu_move = keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);

menu_index+= menu_move;
if (menu_index < 0) menu_index = buttons-1; 
if (menu_index > buttons - 1) menu_index = 0;
if (menu_index != last_selected) audio_play_sound(snd_button1,2,false);
last_selected = menu_index;

//GUI items ease in (ADD LATER)

// fullscreen code
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