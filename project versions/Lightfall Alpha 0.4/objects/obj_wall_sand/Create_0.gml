/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//draw static grass on top
if !place_meeting(x,y-1,class_wall) && random(1) < 0.4 {
	draw_grass = true;	
} else
draw_grass = false;
img_grass = round(random(sprite_get_number(sSandDecorGrass)));


//generate shadow casters
if instance_exists(oPlayer) {
	if distance_to_object(oPlayer) < 400 {
		//dd = instance_create_depth(x,y,depth,oWallCaster);
	}
}