/// @description Draw UI elements
draw_UI_elements(); //set arguments for customizability (ie scale) 
draw_debug_info()

if instance_exists(oPlayer) {
	draw_set_color(c_lime);
	draw_text(10,30,"slowmo: " + string(oPlayer.slowmotion) + " - + ");
}

draw_set_color(c_white);