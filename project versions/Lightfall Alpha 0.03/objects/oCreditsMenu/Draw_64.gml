/// @description Draw Menu
var x_offset = display_get_gui_width()/4;
var y_offset = display_get_gui_height()/6;
draw_set_color(c_black);
draw_rectangle(x_offset, y_offset, display_get_gui_width() - x_offset, display_get_gui_height() -y_offset, false);

draw_set_font(menu_font);
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

draw_set_color(make_color_rgb(157, 166, 165));

display_set_gui_size(RES_W*title_res_scale, RES_H*title_res_scale);

var _menu_x = display_get_gui_width()/2;
var _menu_y = y_offset + 2;

var title_text = "Controls";
draw_text(_menu_x, _menu_y, title_text);

display_set_gui_size(RES_W*text_res_scale, RES_H*text_res_scale);

draw_set_halign(fa_left);

for (var i = 1; i < 7; i++) 
{
	var col = make_color_rgb(115, 120, 119);
	
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i*gui_mult));
	
	var description = "";
	switch i
	{
		case 6:
		description = "Design Lead:";
		break;
		case 5:
		description = "Concept Lead:";
		break;
		case 4:
		description = "Concept Art:";
		break;
		case 3:
		description = "Special thanks";
		break;
		case 2:
		description = "Coding / Bug fixes:";
		break;
		case 1:
		description = "Feedback / Design:";
		break;
	}
	var name = "";
	switch i
	{
		case 6:
		name = "Name";
		break;
		case 5:
		name = "Name";
		break;
		case 4:
		name = "Name";
		break;
		case 3:
		name = "";
		break;
		case 2:
		name = "Name";
		break;
		case 1:
		name = "Name";
		break;
	}
	var x_offset = 100;
	draw_set_color(col);
	draw_text(xx - x_offset,yy,description);
	draw_text(xx + x_offset - 50,yy,name);
}

var txt = menu[0];
if (menu_cursor == 0) 
{
	//txt = string_insert("> ",txt, 0);
	var col = make_color_rgb(115, 209, 204);
}
else
{
	var col = make_color_rgb(115, 120, 119);
}
var xx = menu_x;
var yy = menu_y;
	
draw_set_color(col);
draw_set_halign(fa_center);
draw_text(xx,yy,txt);
	
draw_set_color(c_white);
draw_text(20,40,string(menu_cursor));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_black);
draw_rectangle(gui_width,gui_height-20,gui_width+30,gui_height,false);

