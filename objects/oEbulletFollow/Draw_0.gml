/// @description Insert description here

image_angle = dir; // point_direction(x,y,target.x,target.y); //to do low prio: clip this to 45 degree angles. 
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,1,image_angle,c_white,1);

if global.debugmode {
	draw_text(x,y-40,"new:"+ string(dir_new));
	draw_text(x,y-20,"old:"+ string(dir));
	//draw_text(x,y-60,"angle:"+ string(dir_ang));
}