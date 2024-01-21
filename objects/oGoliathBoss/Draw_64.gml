/// @description draw boss healthbar 
//gm live 
if (live_call()) return live_result;

var hp_color = make_colour_rgb(173,46,51); 
var text_color = make_colour_rgb(243, 255, 237); 
var bgr_color = make_color_rgb(27, 29, 40); //midnight 70
var e_height = sprite_get_height(sBoss_healthbar); 
var width_half = sprite_get_width(sBoss_healthbar)/2; 
var bar_half = (RES_W/2-width_half); 
var y_off = 0; var x_off = 3;
var resolution = 2; 

//draw healthbar
draw_sprite(sBoss_healthbar,0,RES_W/2, e_height);
var percentagehp = (hp / hp_max)*(width_half*2)-x_off*2;
draw_set_color(hp_color);
draw_rectangle(bar_half+x_off,e_height-4,bar_half+x_off+percentagehp-1,e_height+2,0);

//draw the name text
var fnt = font_m5x7;
var enemy_name = "Grok the Guardian"

draw_set_color(text_color);
draw_set_font(fnt); 
draw_set_halign(fa_center);
drawTextOutline(enemy_name, RES_W/2*resolution, e_height+22, fnt, resolution,bgr_color);

//draw HP text
draw_set_font(fSign);
var text_hp = (string(hp) + "/" + string(hp_max));
display_set_gui_size(RES_W * resolution, RES_H * resolution);
draw_text(RES_W/2*resolution,e_height+5.5,text_hp);
display_set_gui_size(RES_W, RES_H);