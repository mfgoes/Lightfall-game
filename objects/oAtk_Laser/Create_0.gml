/// @description init projectile variables

follow = oPlayer;
x_shift = 5//-10 = left
spd = 10;

//set origin to far left. 
attack_size = 120; 
image_xscale = attack_size/sprite_width; //sprite_width = 32;  
image_yscale = 0.2;
image_alpha = 0.3;
//animation
img_index = 0; 
dir_static = oPlayerWeapon.image_angle; 

//dust effect
with(instance_create_layer(x+lengthdir_x(attack_size,dir_static),y+lengthdir_y(attack_size,dir_static),"Bullets",oDust))
{image_alpha = 0.4; vsp = 0; hsp = 0;}
with(instance_create_layer(x+lengthdir_x(attack_size/2,dir_static),y+lengthdir_y(attack_size/2,dir_static),"Bullets",oDust))
{vsp = 0; hsp = 0; image_alpha = 0.3; image_speed = 0.6;}
with(instance_create_layer(x+lengthdir_x(10,dir_static),y+lengthdir_y(10,dir_static),"Bullets",oDust))
{vsp = -0.2; hsp = 0; image_alpha = 0.3; image_speed = 0.6;}