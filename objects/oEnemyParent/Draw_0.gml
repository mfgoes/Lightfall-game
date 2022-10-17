
//draw sprite
if image_alpha < 1
	image_alpha += 0.025;

//freeze visual (color)
//if freeze > 0 image_blend = c_blue; else image_blend = c_white;

draw_sprite_ext(sprite_index,image_index,x+atk_anim_x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

//flash when hit
effect_flash();

#region Draw health bar
	if hp<hp_max { 
		var percentagehp = (hp / hp_max)*20; // 0/0 = -5 1/2 = 5;  2/2 = 10; (multiplied by 10?)
		var bgrcolor = make_colour_rgb(27, 29, 40);
		var red1 = make_colour_rgb(173, 46, 51);
		draw_set_color(bgrcolor);
		draw_set_alpha(0.9);
		draw_rectangle(x-10,y-22,x+10,y-20,0);
		draw_set_alpha(1);
		draw_set_color(red1);
		draw_rectangle(x-10,y-22,x+percentagehp-10,y-20,0);
		draw_set_color(c_white);
	}
#endregion


//debug
if (global.debugmode) {
	//draw collision box 
	draw_set_color(c_blue);
	draw_set_alpha(0.3);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,0);
	draw_set_alpha(1);
	
	//draw hit box
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(x-sign(x - target.x)*hitbox_w,y,x,y-hitbox_h,0);
	draw_set_alpha(1);
}