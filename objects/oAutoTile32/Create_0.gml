/// @description has sand visual
// You can write your code in this editor

// Inherit the auto tiling (fix later)
event_inherited();

//draw static grass on top
if !place_meeting(x,y-1,object_index) && random(1) < 0.4 {
	draw_grass = true;	
} else
draw_grass = false;
img_grass = round(random(sprite_get_number(sSandDecorGrass)));

image_speed = 0;
//init_autotile(); 
alarm[0] = 5; //tile after placements