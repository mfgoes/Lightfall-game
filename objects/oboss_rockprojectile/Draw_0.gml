/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (global.debugmode) {
	draw_text(x,y-10,dir);
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	
	draw_set_alpha(1);
	draw_set_color(c_white);
}