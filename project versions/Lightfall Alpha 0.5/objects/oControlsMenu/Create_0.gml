/// @description setup buttons
event_inherited();

if (live_call()) return live_result; 

array_delete(menu, 0,10); //cleanup
menu_title = "Controls";
menu[0] = "Move: WADS";
menu[1] = "Left mouse: Primary";
menu[2] = "Right mouse: Secondary"; //move this to far bottom
menu[3] = "F: Roll";
menu[4] = "Q: Special";
menu[5] = "Space: Jump";

menu[6] = "back"; //highlight this in the future (draw event)
menu_index = array_length(menu);
menu_move = 6;
