/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
alarm[0] = 150; //destroy

spd = 2;  spd_saved = spd; //this is used for the pause event

target = id; if instance_exists(oPlayer) target = oPlayer; 	
x_new =  sign(target.x-x);
y_new =  sign(target.y-y);
dir = direction; //we will split this up into x and y vectors later. 
dir_new = direction; //change this with a timer
pivot_spd = 0.03; //how fast the bullet can turn (lerp)
image_angle = dir; 

collision_wall = false //don't hit walls at the start
destroy_sound = snElectric_Hit;
