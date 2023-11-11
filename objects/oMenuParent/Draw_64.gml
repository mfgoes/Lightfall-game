/// @description Draw Menu
//draw_text(10,100,alarm[0]);

#region define variables
	//window 
	display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
	var x_offset = display_get_gui_width()/4;
	var y_offset = display_get_gui_height()/5; 
	//assign this in create event now. //var x_pos = display_get_gui_width()/2;	
#endregion

#region draw window and corners
	if (menu_background) {
		//var margin_win =  display_get_gui_width()/4;
		//var margin_y_win = display_get_gui_height()/5; 
		draw_set_color(col_bgr); draw_set_alpha(1);
		draw_rectangle(margin_win, margin_y_win, display_get_gui_width() - margin_win, display_get_gui_height() - margin_y_win, false);
	
		//draw corners
		draw_sprite_ext(sCorner_menu,0,margin_win,margin_y_win,resolution,resolution,0,c_white,1);
		draw_sprite_ext(sCorner_menu,0,display_get_gui_width() - margin_win,margin_y_win,resolution,resolution,270,c_white,1);
		draw_sprite_ext(sCorner_menu,0,margin_win,display_get_gui_height() - margin_y_win,resolution,resolution,90,c_white,1);
		draw_sprite_ext(sCorner_menu,0,display_get_gui_width() - margin_win,display_get_gui_height() - margin_y_win,resolution,resolution,180,c_white,1);
		draw_set_alpha(1);
	}
#endregion

#region draw text
	
	//draw title
	draw_set_color(col_hover);
	draw_set_font(font_header);
	draw_set_halign(text_align);
	draw_text(x_pos, margin_y_win+25, menu_title);

	//draw links
	draw_set_font(font_pixel);
	for (var i = 0; i < menu_index; i++) 
	{
		var xx = x_pos;
		var yy = menu_y_top * resolution + (line_height * i); //define this elsewhere;
		var txt = menu[i];
		if (menu_move == i) 
		{
			txt = string_insert("> ",txt, 0);
			var col = col_hover;
			
		}
		else
		{
			var col = col_font;
		}
		
		draw_set_halign(text_align);
		draw_set_color(col);
		draw_text(xx,yy,txt);	
	}
#endregion

#region draw margins and debug

if global.debugmode = true {
	
	//hitbox for mouse
	draw_set_alpha(0.4);
	draw_rectangle(RES_W-50,menu_y_top*2-5,RES_W+50,menu_y_bot*2,0);
	draw_set_alpha(1);
	draw_text(RES_H-32,RES_H-48,"selected: " + string(menu_move)); 
	draw_text(RES_H-32,RES_H-28,"clicked: " + string(menu_committed)); 
}
#endregion

//redraw cursor on top of menu
display_set_gui_size(RES_W, RES_H); //text is twice the resolution
draw_cursor_custom(); 

//reset draw variables
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);