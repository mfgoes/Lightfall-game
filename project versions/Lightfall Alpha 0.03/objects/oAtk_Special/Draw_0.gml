/// @description Insert description here
//gm live 
//if (live_call()) return live_result; 
if global.debugmode = true {
	draw_set_alpha(0.3);
	draw_set_color(c_red);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	draw_set_color(c_white);
}