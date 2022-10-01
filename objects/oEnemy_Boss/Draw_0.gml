/// @description Insert description here
//freeze visual (color)
if freeze > 0 image_blend = c_blue; else image_blend = c_white;

if (CheckInCamera()) {
	var anim_x_new = -sign(x - target.x)*atk_anim_x;
	draw_sprite_ext(sprite_index,image_index,x+anim_x_new,y,image_xscale,image_yscale,0,c_white,1);

}
	//flash when hit
	effect_flash();


if image_alpha <1 image_alpha+=0.025;

//debug
if global.debugmode = true {
	draw_text(x,y-12,hsp);
	
	draw_set_color(c_blue);
	draw_set_alpha(0.3);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,0);
	draw_set_alpha(1);
	
	//draw hit box
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(x-sign(x - target.x)*25,y,x,y-30,0);
	draw_set_alpha(1);
}