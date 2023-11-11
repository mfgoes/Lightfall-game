/// @description setup buttons
event_inherited();
if (live_call()) return live_result; 

//header
menu_title = "You Died!";
menu_control = true; //can control menu

//buttons
array_delete(menu, 0,10); 
menu[0] = "Continue";
menu[1] = "Back to menu";
menu_index = array_length(menu);
menu_y_top = 175; 

//game over info
info_label[0] = "Level:"; 
info_label[1] = "Time:";
info_label[2] = "Souls:";
info_label[3] = "Score:";

info_value[0] = string(oGame.level_name); 
info_value[1] = global.time_played;
info_value[2] = global.kills; 
info_value[4] = global.kills * 10 + irandom(5); //figure this out later