/// @description Draw Menu
draw_text(10,100,alarm[0]);

#region define variables
	//window 
	display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
	var x_offset = display_get_gui_width()/4;
	var y_offset = display_get_gui_height()/5; 
	var x_mid = display_get_gui_width()/2;	
#endregion

#region draw window
	var margin_win =  display_get_gui_width()/4;
	var margin_y_win = display_get_gui_height()/6.5; 
	draw_set_color(col_bgr); draw_set_alpha(0.8);
	draw_rectangle(margin_win, margin_y_win, display_get_gui_width() - margin_win, display_get_gui_height() - margin_y_win, false);
	draw_set_alpha(1);
#endregion

#region draw text
	
	//draw title
	draw_set_color(col_font);
	draw_set_font(menu_font);
	draw_set_halign(fa_center);
	draw_text(x_mid, margin_y_win+45, menu_title);

	//draw links
	for (var i = 0; i < menu_index; i++) 
	{
		var txt = menu[i];
		if (menu_move == i) 
		{
			txt = string_insert("",txt, 0);
			var col = col_hover;
		}
		else
		{
			var col = col_font;
		}
		var xx = x_mid;
		var yy = menu_y_top * resolution + (line_height * i); //define this elsewhere;
		draw_set_halign(fa_center);
		draw_set_color(col);
		draw_text(xx,yy,txt);	
	}
#endregion

#region draw margins and debug
/*
if global.debugmode = true {
	display_set_gui_size(RES_W, RES_H);
	draw_set_color(c_aqua); draw_set_alpha(0.3);
	draw_rectangle(0,0,RES_W,menu_y_top,0);
	draw_rectangle(0,RES_H,RES_W,menu_y_bot,0);
	draw_text(40,40,menu_index);
}*/
#endregion

//draw cursor 
display_set_gui_size(RES_W, RES_H); //text is twice the resolution
draw_cursor_custom(); 

//reset draw variables
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);