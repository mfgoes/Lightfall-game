/// @description ?
var halfw = w * 0.5;


//Draw the box
draw_set_color(c_black);
draw_set_alpha(0.4);
draw_roundrect_ext(x-halfw-border,y-h-(border*2),x+halfw+border,y,15,15,false);

draw_sprite(sMarker,0,x,y+1);
draw_set_alpha(1);

//Draw text
DrawSetText(c_white,fSign,fa_center,fa_top);

//draw_set_color(c_white);
draw_text(x,y-h-border,text_current);
