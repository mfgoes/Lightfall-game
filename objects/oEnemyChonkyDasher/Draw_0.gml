/// @description customise colour
event_inherited(); 
//change color if attacking (placeholder)
image_blend = c_orange;
if timer_get("charge_timer") > 0 image_blend = c_red;
draw_self();
effect_flash();



if global.debugmode = true { //show collision mask
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	draw_set_alpha(1);
	draw_set_color(c_white);
	draw_text(x,y-20,bbox_bottom);
	draw_text(x,y-40,"sprite" + string(sprite_index));
}