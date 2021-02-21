/// @description Insert description here
//gm live 
if (live_call()) return live_result; 
if timer_get("animation_length") > 1
draw_sprite(sHitSpark,img_index, x+lengthdir_x(attack_size,dir_static),y+lengthdir_y(attack_size,dir_static)); //img_index

draw_set_alpha(0.1);
//draw_self();
draw_set_alpha(1);
	
//draw_text(x,y-20,direction);

/*
if global.debugmode = true { //show collision mask
	draw_self();
	draw_set_alpha(0.1);
	draw_set_color(c_blue);
	draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,0);
	draw_set_alpha(1);
	draw_set_color(c_white); 

	draw_text(x,y,timer_get("animation_length"));  
	draw_text(x,y-30,timer_get("attack_length"));  
}
*/