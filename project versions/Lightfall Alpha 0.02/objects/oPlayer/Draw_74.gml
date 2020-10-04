/// @description Insert description here
// You can write your code in this editor
draw_set_font(fUI);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//draw_text(50,50,string(percent));

draw_text(10,100,"Hook Enabled (P): "+ string(canrope));

//draw player UI
var healthUI = hp * 50;
var healthUImax = hp_max * 50;

draw_set_color(make_colour_rgb(23, 23, 43)); //hp bgr
draw_rectangle(10,18,14+healthUImax,62,0);

draw_set_color(make_colour_rgb(184, 181, 185)); //hp fgr
draw_rectangle(14,22,10+healthUI,58,0);

draw_set_color(c_white);
draw_text(39,31,"HP: " + string(hp));

//Roll test
draw_set_color(c_white);
draw_text(39,61,"image_index: " + string(round(image_index)));
draw_text(230,61,"state " + string(state));
