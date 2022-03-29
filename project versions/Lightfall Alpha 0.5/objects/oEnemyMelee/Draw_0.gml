/// @description Insert description here
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
	draw_text(x,y-sprite_height,"state: " + string(current_state));
	draw_text(x,y-sprite_height-20,"patrol_dir: " + string(patrol_dir));	
	draw_text(x,y-sprite_height-30,"walk_spd: " + string(walk_spd));	
	
	//draw bounding box 
	draw_set_color(c_green) draw_set_alpha(0.4);
	draw_rectangle(bbox_left,bbox_bottom,bbox_right,bbox_top,0);
	draw_set_color(c_white);
	
	//draw collision line with player to obstacles
	if collision_line(x,y-5,target.x,target.y-5,oWall,0,0) draw_set_color(c_red) else draw_set_color(c_white);
	draw_line(x,y-5,target.x,target.y-5);
}
draw_set_alpha(1);
draw_set_color(c_white);
