/// @description display damage number

draw_set_halign(fa_center);
draw_set_color(c_black);
draw_set_font(fSign);
if value > 2 image_xscale = 0.25*value; else image_xscale = 0.3;
if value > 9 image_xscale = 0.5; //max size
draw_set_alpha(0.5);
draw_text_transformed(x,y-image_xscale*5,"-"+string(value),image_xscale,image_xscale,0);
draw_set_color(col_current);
draw_set_alpha(1);
draw_text_transformed(x,y-0.5-image_xscale*5,"-"+string(value),image_xscale,image_xscale,0);