/// @description GUI/VARS/Menu Setup
global.has_control = false; //replace menu pauses with a global one

//init transition object (required for changing rooms)
instance_create_depth(0,0,depth,oTransition);


//init UI colors
col_regular = make_color_rgb(25,22,23); //dark
col_active = make_color_rgb(235,242,226);
col_bgr = make_color_rgb(25,22,23);
resolution = 2;
button_h = 30; //button vertical spacing
menu_x = RES_W * RES_SCALE-button_h;
menu_y = RES_H * RES_SCALE-140;

//buttons
button[0] ="New Game";
button[1] = "Continue";
button[2] = "Settings";
button[3] = "Quit";

buttons = array_length(button);
menu_committed = 0; 
menu_font = f_title_sans;
menu_index = 0;
last_selected = 0;

//generate objects if required
//if !instance_exists(oMusic) instance_create_depth(x,y,depth,oMusic);