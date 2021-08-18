/// @description GUI/VARS/Menu Setup
text_res_scale = 1; //how much to scale the pixel art
title_res_scale = .7;


//Resize window & applicatiom surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

//set size of text + GUI. Higher = smaller
display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);

//center window
var display_width  = display_get_width();
var display_height = display_get_height();
var window_width = RES_W * text_res_scale;
var window_height = RES_H * text_res_scale;
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

menu[2] = ">";
menu[1] = "<";
menu[0] = "Back";

var button = instance_create_layer(display_get_gui_width()/2 + 80, menu_y - menu_item_height * 6 * gui_mult, "Player", oButton);
button.text = menu[2];
button.index = 2;
with button color = make_color_rgb(115, 120, 119);

var button = instance_create_layer(display_get_gui_width()/2 + 30, menu_y - menu_item_height * 6 * gui_mult, "Player", oButton);
button.text = menu[1];
button.index = 1;
with button color = make_color_rgb(115, 120, 119);

menu_index = array_length_1d(menu);

menu_top = menu_y - ((menu_item_height * 1.5) * 6);
menu_move = menu_index - 1;
cursor_sprite = sCrosshairs;
