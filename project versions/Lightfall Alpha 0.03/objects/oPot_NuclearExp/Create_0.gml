/// @description Insert description here
//Set all variable definitions in create event instead (easier to find)
x += random_range(-4,4);
vsp = 0; 
grv = 0.3;
hp = 1;
image_speed = 0;
screen_shake = 0;
flash = 0;
depth+=1;

//create collision object
mywall = instance_create_layer(x,y,layer,pShootable);
with (mywall)
{
	sprite_index = other.sprite_index;
	mask_index = other.mask_index;
	image_alpha = 0;
}