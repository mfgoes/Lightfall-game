/// @description Insert description here
// You can write your code in this editor
var RES = global.RES_TEXT; 

if toast_type = variant.normal {
	draw_set_font(oGame.font); 
	draw_text_transformed(_x*RES,_y*RES,str,RES_T,RES_T,0);
}
if toast_type = variant.damage {
	var size = lerp(1,0.3,alarm[1] / 60); 
	col_dmg1 = make_colour_rgb(225,122,132); 
	col_dmg2 = make_colour_rgb(217,87,99); 
	
	if alarm[1] <= 0 {
		draw_set_color(col_dmg2);
	}
	else {
		draw_set_color(col_dmg1);
	}
	
	draw_text_transformed(_x*RES,_y*RES,str,size,size,0);
	draw_set_color(c_white); 
}