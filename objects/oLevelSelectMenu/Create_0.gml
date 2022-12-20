/// @description setup buttons
event_inherited();

array_delete(menu, 0,10); //cleanup
menu_title = "Level Select";
menu[0] ="Level 1";
menu[1] = "Level 2";
menu[2] = "Level 3";
menu[3] = "Level 4";
menu[4] = "Level 5";
menu[5] = "Back";
menu_index = array_length(menu);
