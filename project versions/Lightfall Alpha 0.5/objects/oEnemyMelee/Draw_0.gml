/// @description Insert description here
// You can write your code in this editor

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
	
	var free_tile = false;
	var check_tile2 = (collision_point(x + patrol_dir*TILE_SIZE,y+TILE_SIZE*2, oWall,0,0)); //check 2 tiles down
	var check_tile1 = (collision_point(x + patrol_dir*TILE_SIZE,y+TILE_SIZE, oWall,0,0)); //check existing tile
	
	if (check_tile1) or (check_tile2) free_tile = true;
	
	draw_rectangle(x+(TILE_SIZE*2)*patrol_dir,y,x,y+TILE_SIZE*2,1);
	
	draw_text(x,y-sprite_height,"free_tile: " + string(free_tile));
	draw_text(x,y-sprite_height-20,"patrol_dir: " + string(patrol_dir));
	
}

draw_set_alpha(1);


