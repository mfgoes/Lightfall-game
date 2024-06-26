 /// @description GUI/VARS/Menu Setup
global.has_control = false; //replace menu pauses with a global one

//init transition object (required for changing rooms)
instance_create_depth(0,0,depth,oTransition);

//skip menu if toggle is on
if (DEV_MODE) { //skip menu if in devleoper mode
	room_goto_next();
}

//init UI colors
col_regular = make_color_rgb(204,205,189); //basic, white
col_active = make_color_rgb(235,242,226);
col_yellow = make_color_rgb(204,186,112);
col_bgr = make_color_rgb(25,22,23); //brown (ie for UI boxes)

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 24;

//UI variables
resolution = 2;
button_h = 30; //button vertical spacing
menu_x = RES_W * RES_SCALE-button_h;
menu_y = RES_H * RES_SCALE-140;

//buttons (called menu in other menus. to do: change menu to button in other places). 
button[0] ="Continue";
button[1] = "New Game";
button[2] = "Level Select"; //add settings back later
button[3] = "Quit";

buttons = array_length(button);
menu_committed = 0; 
font_pixel = f_title_sans;
font_pixel_small = fSign;

menu_index = 0;
last_selected = 0;

//cursor input for menu
menu_y_top = 100; //this is a fixed top position (starts after title)
menu_y_bot = menu_y_top + (button_h*array_length(button))/2;


//generate objects if required
//if !instance_exists(oMusic) instance_create_depth(x,y,depth,oMusic);