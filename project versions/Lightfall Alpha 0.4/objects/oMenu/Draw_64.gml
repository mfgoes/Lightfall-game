/// @description Draw Menu

draw_set_font(font_UI);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
var i = 0;

repeat(buttons) {
		draw_set_font(fMenu);
		draw_set_halign(fa_right);
		draw_set_color(col_regular);
		var txt = button[i];
	
		if (menu_index == i) { //active button
			draw_set_color(col_active);
			txt = string_insert(">",txt, 0); 
		}	
		draw_text(menu_x,menu_y + button_h * i,txt);
		i++;
}
