/// @description Insert description here
// You can write your code in this editor

if (live_call()) return live_result; 

//set target
if instance_exists(oPlayer) target = oPlayer; else {
	target = id; 
}
var anim_x_new = -sign(x - target.x)*atk_anim_x;


draw_sprite_ext(sprite_index,image_index,x+anim_x_new,y,image_xscale,image_yscale,0,c_white,1);



if global.debugmode = 1 {
	draw_set_alpha(1);
	draw_set_color(c_orange);
	draw_circle(x,y,sight_range,1);
	draw_circle(x,y,atk_range,1);
	draw_text(x,y-sprite_height,"current_state: " + string(current_state));
	draw_text(x,y-sprite_height-20,"t: " + string(atk_anim_x));
	
	var dist_start = abs(abs(x) - abs(xstart));
	draw_text(x,y-sprite_height-30,"prep " + string( timer_get("anim_prep")));
	draw_text(x,y-sprite_height-50,"anim " + string(atk_anim_x));
	
	//draw collision mask and origin
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1);
	
	var xoff = sprite_get_xoffset(sprite_index);
	var yoff = sprite_get_yoffset(sprite_index)/2;
	draw_set_color(c_lime);
	draw_rectangle(x-xoff/2,y-0.5,x+xoff/2,y+0.5,0);
	draw_rectangle(x-0.5,y-yoff,x,y+yoff,0);
}

draw_set_alpha(1);


