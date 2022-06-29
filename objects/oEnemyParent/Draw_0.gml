
//draw sprite
if image_alpha < 1
	image_alpha += 0.025;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1);

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