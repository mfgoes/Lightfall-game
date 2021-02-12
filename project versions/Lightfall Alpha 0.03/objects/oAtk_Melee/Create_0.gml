/// @description init projectile variables
if (live_call()) return live_result; 
follow = oPlayer;
x_shift = 5//-10 = left
spd = 10;

//set origin to far left. 
attack_distance = 94/sprite_width; //sprite_width = 32;  
image_xscale = attack_distance;
image_yscale = 0.7;
image_alpha = 0.3;