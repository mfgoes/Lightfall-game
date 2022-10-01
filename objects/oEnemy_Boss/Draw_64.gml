/// @description draw boss healthbar 

var hp_color = make_colour_rgb(184,102,98); 
var e_height = sprite_get_height(sBoss_healthbar); 
var width_half = sprite_get_width(sBoss_healthbar)/2; 
var bar_half = (RES_W/2-width_half); 
var y_off = 0; var x_off = 3;

draw_sprite(sBoss_healthbar,0,RES_W/2, RES_H-e_height);
//draw healthbar
var percentagehp = (hp / hp_max)*(width_half*2)-x_off*2;

draw_set_color(hp_color);
draw_rectangle(bar_half+x_off,RES_H-13,bar_half+x_off+percentagehp-2,RES_H-9,0);

