/// @description setup buttons
event_inherited();

if (live_call()) return live_result;

//skip menu if toggle is on
if (DEV_MODE) { //skip menu if in devleoper mode
	room_goto(rLevel4); //can also just send user to a Dev test room. 
}


array_delete(menu, 0,10); //cleanup
menu_title = "";
menu[0] ="New Game";
menu[1] = "Continue";
menu[2] = "Stage Select";
menu[3] = "Fullscreen";
menu[4] = "Quit to Desktop";
menu_index = array_length(menu);

//personalised menu
text_align = fa_center;
x_pos = RES_W; //text x position
menu_y_top = 140; 
menu_y_bot = menu_y_top + (line_height*array_length(menu))/2; //to do: make this dynamic // (line_height*6)/2;

menu_background = false; 
//window size
margin_win = TILE_SIZE*2; // (gui_width/5);
margin_y_win = TILE_SIZE*3;