/// @description setup buttons
event_inherited();


array_delete(menu, 0,10); //cleanup
menu_title = "Credits";
menu[0] = "Created by: Mischa";
menu[1] = "Art: Mischa";
menu[2] = "Art: Jeimansutrisman"; //move this to far bottom
menu[3] = "Thanks: RedPixel"; //move this to far bottom

menu[4] = "back"; //highlight this in the future (draw event)
menu_index = array_length(menu);
menu_move = 4; //highlight back button
