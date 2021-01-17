/// @description GUI/VARS/Menu Setup

#macro SAVEFILE "Save.sav"
#macro RES_W 480	
#macro RES_H 270
#macro RES_SCALE 2 //how much to scale the pixel art
#macro RES_RATIO RES_H/RES_W
#macro CAM_SMOOTH 0.1

//Resize window & applicatiom surface
window_set_size(RES_W * RES_SCALE, RES_H * RES_SCALE); 
surface_resize(application_surface, RES_W * RES_SCALE, RES_H * RES_SCALE);

//set size of text + GUI. Higher = smaller
display_set_gui_size(RES_W*RES_SCALE, RES_H*RES_SCALE);

//center window
var display_width  = display_get_width();
var display_height = display_get_height();
var window_width = RES_W * RES_SCALE;
var window_height = RES_H * RES_SCALE;
window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);

 
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 24;

menu_x = gui_width + 20;
menu_y = gui_height - gui_margin;
menu_x_target = gui_width - gui_margin;
menu_speed = 15; //lower = faster
menu_font = fMenu;
menu_item_height = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] ="New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);

menu_top = menu_y - ((menu_item_height * 1.5) * menu_items);
menu_cursor = 2;
cursor_sprite = sCrosshairs;
