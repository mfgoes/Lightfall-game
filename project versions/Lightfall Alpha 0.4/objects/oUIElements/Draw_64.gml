/// @desc draw UI

//draw objective (move to function later)
if room != rMenu {
	draw_objective_UI(); 
}
//draw boss UI
draw_boss_UI(); 

//health, cooldowns, etc
draw_UI_elements(); 

//debug only
draw_debug_info();

//level details
show_region_title();

/*
if instance_exists(oLevelGenerator) {
	// You can write your code in this editor
	draw_set_halign(fa_left);
	draw_set_font(fSign);
	draw_text(200,100,"grass dir " + string(oLevelGenerator.grass_global_dir));
}
*/