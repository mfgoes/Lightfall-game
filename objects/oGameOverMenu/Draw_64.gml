/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
if (live_call()) return live_result; 
//draw values

#region draw text
	draw_set_font(font_pixel);
	display_set_gui_size(RES_W*resolution, RES_H*resolution); //text is twice the resolution
	
	var col = col_hover;
	var length = array_length(info_label); // Get the length of info_label
	var txt = info_label[0];
	draw_set_color(col);
	
	for (var i = 0; i < length; i++) 
	{
	var xx = RES_W - 100;
	var yy = RES_H - 85 + (line_height * i);
	var txt = info_label[i];
	var txt2 = info_value[i]; 
	draw_set_halign(fa_left);
	draw_text(xx, yy, txt);	
	
	draw_set_halign(fa_right);
	draw_text(xx+200, yy, txt2);	
	}
#endregion


display_set_gui_size(RES_W, RES_H);