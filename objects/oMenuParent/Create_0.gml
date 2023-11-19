/// @description parent menu

resolution = 2; //replaces text scale
depth = 10000; //place below transition effect

//mouse position tracking
myPrevious = 0;

//colors
col_font =  make_color_rgb(204, 205, 189); //white
col_muted = make_color_rgb(156, 158, 180); //grayish white
col_hover = make_color_rgb(233, 224, 170); //banana yellow
col_bgr = make_color_rgb(24, 24, 33); // midnight blue
text_align = fa_center;
//

//coordinates of created menu
x_pos = (display_get_gui_width()/2)*resolution;	

//size of entire GUI
gui_width = display_get_gui_width()*resolution; //to do: integrate resolution into this
gui_height = display_get_gui_height()*resolution;	
gui_margin = 24;
//size of window
margin_win =  (gui_width/4);
margin_y_win = (gui_height/5);


menu_x_target = gui_width/2;
menu_speed = 15; //lower = faster
font_pixel = f_title_sans;
font_header = font_m5x7;
menu_committed = -1;
menu_control = true; //can control menu
menu_move_current = 0; //used for click sound basically
m = 0; //??

menu_title = "Menu";
menu[0] ="Continue";
menu[1] = "Sound Settings";
menu[2] = "Controls";
menu[3] = "Credits";
menu[4] = "Back to Main Menu";
menu[5] = "Quit";

menu_index = array_length(menu);
menu_item_height = font_get_size(f_title_sans)*2; //rename to line height later
menu_y =  (RES_H + 120) *2; 
menu_background = true;


//determine menu item positions
menu_move = menu_index - 1;
line_height = 40; //line height. divide the screen by this number. 
menu_y_top = 90; //this is a fixed top position (starts after title)
menu_y_bot = menu_y_top + (line_height*array_length(menu))/2; //to do: make this dynamic // (line_height*6)/2;

//minimum time before you can press another button
alarm[0] = 10;