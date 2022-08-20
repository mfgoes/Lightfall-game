 /// @description GUI/VARS/Menu Setup
global.has_control = false; //replace menu pauses with a global one

//init transition object (required for changing rooms)
instance_create_depth(0,0,depth,oTransition);

//skip menu if toggle is on
if (skip_menu) {
	SlideTransition(TRANS_MODE.GOTO,rLevel1); 
}

//init UI colors
col_regular = make_color_rgb(204,205,189); //basic, white
col_active = make_color_rgb(235,242,226);
col_yellow = make_color_rgb(204,186,112);
col_bgr = make_color_rgb(25,22,23); //brown (ie for UI boxes)


//UI variables
resolution = 2;
button_h = 30; //button vertical spacing
menu_x = RES_W * RES_SCALE-button_h;
menu_y = RES_H * RES_SCALE-140;

//buttons
button[0] ="Continue";
button[1] = "New Game";
button[2] = "Settings";
button[3] = "Quit";

buttons = array_length(button);
menu_committed = 0; 
font_pixel = f_title_sans;
font_pixel_small = fSign;
font_smooth = f_smooth;

menu_index = 0;
last_selected = 0;

//generate objects if required
//if !instance_exists(oMusic) instance_create_depth(x,y,depth,oMusic);