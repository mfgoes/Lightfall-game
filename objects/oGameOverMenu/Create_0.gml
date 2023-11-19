/// @description setup buttons
event_inherited();
if (live_call()) return live_result; 

//header
menu_title = "You Died!";
menu_control = true; //can control menu
bgr_alpha = 0.3;

//buttons
array_delete(menu, 0,10); 
menu[0] = "Try again";
menu[1] = "Back to menu";
menu_index = array_length(menu);
menu_y_top = 200; 
menu_y_bot = menu_y_top + (line_height*array_length(menu))/2; //important to reset bottom of UI every time top is changed.

//game over info
info_label[0] = "Level:"; 
info_label[1] = "Time:";
info_label[2] = "Souls:";
info_label[3] = "Score:";

info_value[0] = string(oGame.level_name); 
info_value[1] = global.time_played;
info_value[2] = global.kills; 
info_value[4] = global.kills * 10 + irandom(5); //figure this out later


//set new zoom level
oCamera.zoom = 0.1;