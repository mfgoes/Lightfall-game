/// @description Draw Menu

draw_set_font(menu_font);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

for (var i = 0; i < menu_items; i++) 
{
	var offset = 2;
	var txt = menu[i];
	if (menu_cursor == i) 
	{
		txt = string_insert("> ",txt, 0);
		var col = c_white;
	}
	else
	{
		var col = c_gray;	
	}
	var xx = menu_x;
	var yy = menu_y - (menu_item_height * (i*1.5));
	draw_set_color(c_black);
	
	draw_text(xx-offset,yy,txt);	//draw outline
	draw_text(xx+offset,yy,txt);
	draw_text(xx,yy-offset,txt);
	draw_text(xx,yy+offset,txt);
	draw_set_color(col);
	draw_text(xx,yy,txt);
	
}
draw_set_color(c_white);
draw_text(20,40,string(menu_cursor));

draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_set_color(c_black);
draw_rectangle(gui_width,gui_height-20,gui_width+30,gui_height,false);
draw_set_color(c_white);
