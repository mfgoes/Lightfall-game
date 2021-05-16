/// @description display damage number

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_text_transformed(x,y,"-"+string(value),image_xscale,image_xscale,0);
draw_set_color(c_white);
draw_text_transformed(x,y-1,"-"+string(value),image_xscale,image_xscale,0);