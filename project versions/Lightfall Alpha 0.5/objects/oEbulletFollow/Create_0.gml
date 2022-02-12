/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
alarm[0] = 150; //destroy
dir = direction; //we will split this up into x and y vectors later. 
spd = 0; 

target = id; if instance_exists(oPlayer) target = oPlayer; 	
x_new =  sign(target.x-x);
y_new =  sign(target.y-y);
