/// @description setup buttons
event_inherited();

if (live_call()) return live_result; 

array_delete(menu, 0,10); //cleanup
menu_title = "Sound Settings";
menu[0] = "Volume";
menu[1] = "back";
menu_index = array_length(menu);
m = 0;

//create buttons. Move this according to menu position (when needed)
//note: coordinates are incorrectly mapped atm due to GUI scaling. 
BL = instance_create_depth(0,0,depth,oButton);
BR = instance_create_depth(0,0,depth,oButton);

BL_hover = false; //check if buttons are hovered
BR_hover = false;
