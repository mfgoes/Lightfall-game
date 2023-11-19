/// @desc draw UI
//GMLive
if (live_call()) return live_result; 
		
//draw boss UI
//draw_boss_UI(); 

//health, cooldowns, etc
draw_UI_elements();

//hide cursor in the menu (so that it can be redrawn I guess? idk what this does.)
if !instance_exists(oMenuParent) {
	display_set_gui_size(RES_W, RES_H); //text is twice the resolution
	draw_cursor_custom(cursor_scale); 
}

//debug only
if instance_exists(oPlayer) {
	draw_debug_info();
}

//level details
//show_region_title();
