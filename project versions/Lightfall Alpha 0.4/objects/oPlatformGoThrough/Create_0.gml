/// @description Insert description here
image_speed = 0;
image_index = 0;
if place_meeting(x+1,y,object_index) && !place_meeting(x-1,y,object_index) image_index = 1;	//if left
if place_meeting(x-1,y,object_index) && !place_meeting(x+1,y,object_index) image_index = 2; //if right

sprite_index = -1; //removes collision box
