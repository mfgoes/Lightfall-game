/// @desc draw UI

//draw objective (move to function later)
if room != rMenu {
	draw_objective_UI(); 
}
//draw boss UI
//draw_boss_UI(); 

//health, cooldowns, etc
draw_UI_elements(); 

//draw cursor 
display_set_gui_size(RES_W, RES_H); //text is twice the resolution
draw_cursor_custom(); 


//debug only
draw_debug_info();

//level details
//show_region_title();
