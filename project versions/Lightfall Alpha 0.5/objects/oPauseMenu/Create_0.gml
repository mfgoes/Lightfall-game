/// @description parent menu

resolution = 2; //replaces text scale
if (live_call()) return live_result; 

//mouse position tracking
myPrevious = 0;

//colors
col_font = c_white;
col_hover = make_color_rgb(226, 178, 126);
col_bgr = c_black;
//

//size 
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 24;

menu_x_target = gui_width/2;
menu_speed = 15; //lower = faster
menu_font = fSign;
menu_committed = -1;
menu_control = true; //can control menu

gui_mult = 1.5; //?

menu[0] ="Continue";
menu[1] = "Sound Settings";
menu[2] = "Controls";
menu[3] = "Credits";
menu[4] = "Back to Main Menu";
menu[5] = "Quit";

menu_index = array_length(menu);
menu_item_height = font_get_size(fMenu)*2; //rename to line height later
menu_y =  (RES_H + 120) *2; 



//determine menu item positions
menu_move = menu_index - 1;
line_height = 40; //line height. divide the screen by this number. 
menu_y_top = 90; //this is a fixed top position. 
menu_y_bot = menu_y_top + (line_height*6)/2; //dynamic 
