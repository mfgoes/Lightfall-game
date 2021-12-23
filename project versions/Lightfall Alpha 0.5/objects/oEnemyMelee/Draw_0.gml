/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (live_call()) return live_result; 

if global.debugmode = 1 {
	draw_set_alpha(1);
	draw_set_color(c_orange);
	draw_circle(x,y,sight_range,1);
	draw_circle(x,y,atk_range,1);
	draw_text(x,y-sprite_height,"current_state: " + string(current_state));
	draw_text(x,y-sprite_height-20,"t: " + string(patrol_dir));
	
	var dist_start = abs(abs(x) - abs(xstart));
	draw_text(x,y-sprite_height-30,"xstart " + string(dist_start));
	
	//draw collision mask and origin
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	
	var xoff = sprite_get_xoffset(sprite_index);
	var yoff = sprite_get_yoffset(sprite_index)/2;
	draw_set_color(c_lime);
	draw_rectangle(x-xoff,y-1,x+xoff,y+1,0);
	draw_rectangle(x-0.5,y-yoff,x+0.5,y+yoff,0);
}

draw_set_alpha(1);


