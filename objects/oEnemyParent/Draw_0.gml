
//draw sprite
if image_alpha < 1
	image_alpha += 0.025;

//freeze visual (color)
//if freeze > 0 image_blend = c_blue; else image_blend = c_white;

draw_sprite_ext(sprite_index,image_index,x+atk_anim_x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

//flash when hit
effect_flash();


//debug
if (global.debugmode) {
	draw_set_color(c_red);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,1);	
	draw_set_color(c_white);
}

//debug old
/*
if (global.debugmode) {
	//draw collision box 
	draw_set_color(c_blue);
	draw_set_alpha(0.3);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,0);
	draw_set_alpha(1);
	//set target
	if instance_exists(oPlayer)
		target = oPlayer;
	else {
		hsp = 0;
		target = id; 
	}

	//draw hit box
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	
	draw_rectangle(x-sign(x - target.x)*hitbox_w,y,x,y-hitbox_h,0);
	draw_set_alpha(1);
}
*/