/// @description Insert description here
if global.debugmode = true { //show collision mask
	draw_set_alpha(0.5);
	draw_set_color(c_blue); //blue = mask, red = hitbox
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	draw_set_alpha(1);
	draw_set_color(c_white);
}

draw_sprite(sprite_index,image_index,x,y);

effect_flash(); 

