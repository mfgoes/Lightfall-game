/// @description Insert description here
// You can write your code in this editor
var RES = 1; 
draw_set_color(c_white);

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
draw_text_transformed(_x,_y,str,RES,RES,0);

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fSign);