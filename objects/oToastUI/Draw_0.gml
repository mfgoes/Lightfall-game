/// @description Insert description here
// You can write your code in this editor
if (live_call()) return live_result; 
var RES = 1; 
var box_y = _y+8; //based on text position
var border = 2;
var halfw = string_width(str) * 0.5 + border*2; // Half width of the text plus border
var h = string_height(str) + border * 2;      // Height of the text plus top and bottom border
	
draw_set_color(c_white);
draw_set_halign(fa_center);

if toast_type = variant.normal or toast_type = variant.damage {
	RES =  global.RES_TEXT;
	draw_set_font(oGame.font_pixel); 
}
if toast_type = variant.h2 {
	RES =  global.RES_TEXT*2; 
	draw_set_font(oGame.font_poster); 
}
if toast_type = variant.h1 {
	RES =  global.RES_TEXT*3; 
	draw_set_font(oGame.font_poster); 
}
if toast_type = variant.upgrade {
	RES =  global.RES_TEXT*2; 
	draw_set_font(oGame.font_poster);
	// Draw the rectangle
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_roundrect_ext(x-halfw, box_y-h/2, x+halfw, box_y+h/2, 15, 15, false); // Adjusted y positions to center the box around box_y
	draw_set_alpha(1); 
	draw_set_color(col_text); 
}


draw_text_transformed(_x,_y,str,RES,RES,0);

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fSign);