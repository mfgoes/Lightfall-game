/// @description GUI/VARS/Menu Setup

//#macro SAVEFILE "Save.sav"
#macro RES_W 480	
#macro RES_H 270
text_res_scale = 1; //how much to scale the pixel art
title_res_scale = .7;
#macro RES_RATIO RES_H/RES_W
#macro CAM_SMOOTH 0.1

//Resize window & applicatiom surface
//window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
//surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

//set size of text + GUI. Higher = smaller
display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);

//center window
//var display_width  = display_get_width();
//var display_height = display_get_height();
//var window_width = RES_W * text_res_scale;
//var window_height = RES_H * text_res_scale;
//window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

 
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 24;

menu_x = gui_width/2;
menu_y = gui_height/2 + 70;
menu_x_target = gui_width/2;
menu_speed = 15; //lower = faster
menu_font = fSign;
menu_item_height = font_get_size(menu_font);
menu_committed = -1;
menu_control = true;

gui_mult = 1.5;

menu[0] = "Back";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_item_height * 1.5) * 7);
menu_cursor = 2;
cursor_sprite = sCrosshairs;