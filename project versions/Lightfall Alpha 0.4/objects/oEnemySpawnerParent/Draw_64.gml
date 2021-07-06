/// @description Insert description here
// You can write your code in this editor
if global.wavetotal - global.killsthiswave = 0 {
draw_set_font(fUI);
draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(RES_W/2-60,10,RES_W/2+60,35,0);
if title_alpha < 1 title_alpha+=0.05;

killtextscale = max(killtextscale * 0.1, 1); 

draw_set_alpha(title_alpha); 
draw_set_color(c_black);
draw_text_transformed(RES_W/2,16,string("Wave Defeated"),killtextscale,killtextscale,0);
draw_text_transformed(RES_W/2-1,15,string("Wave Defeated"),killtextscale,killtextscale,0);
draw_set_color(c_white);
draw_text_transformed(RES_W/2,15,string("Wave Defeated"),killtextscale,killtextscale,0);	
draw_set_alpha(1);
} else title_alpha = 0;

draw_text(40,40,global.wavetotal - global.killsthiswave); 