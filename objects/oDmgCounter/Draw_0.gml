/// @description display damage number

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(f_smooth);
draw_text_transformed(x,y,"-"+string(value),image_xscale,image_xscale,0);
draw_set_color(col_text);
draw_text_transformed(x,y-0.5,"-"+string(value),image_xscale,image_xscale,0);