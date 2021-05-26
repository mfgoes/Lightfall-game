/// @description Draw UI elements
draw_UI_elements(); //set arguments for customizability (ie scale) 
draw_debug_info()

draw_set_color(c_lime);
draw_text(50,60,"slowmo: " + string(oPlayer.slowmotion) + " - + ");
draw_set_color(c_white);