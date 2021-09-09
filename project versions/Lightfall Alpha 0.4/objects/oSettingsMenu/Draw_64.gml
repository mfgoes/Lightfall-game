/// @description Draw Menu
var x_offset = display_get_gui_width()/4;
var y_offset = display_get_gui_height()/6;
draw_set_color(c_black);
draw_rectangle(x_offset, y_offset, display_get_gui_width() - x_offset, display_get_gui_height() -y_offset, false);

draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_set_color(make_color_rgb(157, 166, 165));

display_set_gui_size(RES_W*title_res_scale, RES_H*title_res_scale);

var _menu_x = display_get_gui_width()/2;
var _menu_y = y_offset - 10;

var title_text = "Sound Settings";
draw_text(_menu_x, _menu_y, title_text);

draw_set_halign(fa_left);

display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);

var xx = display_get_gui_width()/2;
var yy = menu_y - menu_item_height * 6 * gui_mult;

var gray = make_color_rgb(115, 120, 119);
var blue = make_color_rgb(115, 209, 204);
var x_offset = 50;
	
draw_set_color(gray);
draw_text(xx + x_offset*1.1, yy, string(round(global.sound_volume * 100)));
		
var description = "Sound volume:";
draw_set_color(gray);
draw_text(xx - x_offset*2.5 + 20,yy,description);
		
yy = menu_y - menu_item_height;

draw_set_color(gray);
if menu_move == 0 draw_set_color(blue);
draw_set_halign(fa_center);
draw_text(xx,yy,menu[0]);
	
draw_set_color(c_white);
draw_text(20,40,string(menu_move));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_black);
draw_rectangle(gui_width,gui_height-20,gui_width+30,gui_height,false);
draw_set_color(c_white);

draw_cursor_custom(); 