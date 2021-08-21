/// @description Draw UI elements
//DRAW UI
draw_UI_elements(); //player UI elements
draw_debug_info();

var color_text = make_color_rgb(254,231,97);
var col_bgr = make_color_rgb(36,19,33);

//move this to seperate script later

if (global.wavetotal - global.killsthiswave = 0) { 
	draw_sprite(sTexts_levelclear,0,RES_W/2,17); 
}
if (global.wavetotal - global.killsthiswave !=0) { 

	//outline (improve later)
	draw_set_font(font_UI);
	draw_set_halign(fa_center);
	draw_set_color(col_bgr);
	draw_set_alpha(1);

	draw_text_transformed(RES_W/2,16,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_text_transformed(RES_W/2,18,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_text_transformed(RES_W/2-1,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_text_transformed(RES_W/2+1,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	
	draw_set_color(color_text);
	draw_text_transformed(RES_W/2,17,string(global.wavetotal - global.killsthiswave) + " enemies left",killtextscale,killtextscale,0);
	draw_set_color(c_white);
}