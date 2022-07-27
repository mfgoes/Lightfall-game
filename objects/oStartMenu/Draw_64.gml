/// @description Draw Menu

//fix scaling issues

display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution

draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
var i = 0;

repeat(buttons) {
		draw_set_color(col_regular);
		var txt = button[i];
	
		if (menu_index == i) { //active button
			draw_set_color(col_active);
			txt = string_insert(">",txt, 0); 
		}	
		draw_text(menu_x,menu_y + button_h * i,txt);
		i++;
}



//version
draw_set_halign(fa_left);
draw_set_color(col_active);
var pl_m = 32; //padding left
draw_text(pl_m,RES_H*resolution-32,"v0.2 Alpha");

display_set_gui_size(RES_W, RES_H); //reset
draw_cursor_custom(); 
