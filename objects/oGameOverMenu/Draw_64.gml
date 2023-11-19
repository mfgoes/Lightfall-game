/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
//event_inherited();
if (live_call()) return live_result; 
//draw values

display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
var x_offset = display_get_gui_width()/4;
var y_offset = display_get_gui_height()/5; 
var font_UI = font_m5x7; 

//draw background
draw_set_color(c_black);
draw_set_alpha(bgr_alpha);
if bgr_alpha <= 0.6 bgr_alpha +=0.02; //fade in
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
draw_set_alpha(1);

//draw text itemsx
#region 
	//draw title
	draw_set_color(col_font);
	draw_set_font(font_UI);
	draw_set_halign(text_align);
	draw_text(x_pos, margin_y_win, "You've died!");

	//draw links
	draw_set_font(font_UI);
	for (var i = 0; i < menu_index; i++) 
	{
		var xx = x_pos;
		var yy = menu_y_top * resolution + (line_height * i); //define this elsewhere;
		var txt = menu[i];
		if (menu_move == i) 
		{
			//txt = string_insert("> ",txt, 0);
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

	draw_set_font(font_UI);
	display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
	
	var length = array_length(info_label); // Get the length of info_label
	var txt = info_label[0];
	for (var i = 0; i < length; i++) 
	{
	var xx = RES_W - 100;
	var yy = RES_H - 85 + (line_height * i);
	var txt = info_label[i];
	var txt2 = info_value[i]; 
	
	draw_set_color(col_muted);
	draw_set_halign(fa_left);
	draw_text(xx-80, yy, txt);	
	
	draw_set_color(col_hover);
	draw_set_halign(fa_right);
	draw_text(xx+280, yy, txt2);	
	}
#endregion

//draw decorations (ie lines)
draw_sprite_ext(UI_line_header,0,RES_W,margin_y_win-5,resolution,resolution,0,c_white,1);
draw_sprite_ext(UI_line_regular,0,RES_W,margin_y_win+36,resolution,resolution,0,c_white,1);
draw_sprite_ext(UI_line_regular,0,RES_W,menu_y_bot*resolution-110,resolution,resolution,0,c_white,1);


//reset GUI
display_set_gui_size(RES_W, RES_H);

//redraw cursor on top of menu
display_set_gui_size(RES_W, RES_H); //text is twice the resolution
draw_cursor_custom(); 