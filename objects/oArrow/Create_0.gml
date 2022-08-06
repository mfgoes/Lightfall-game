/// @description init projectile variables
if(live_call()) return live_result;


super_arrow = false;
grv = 0.003; // was 0.02 gravity
vsp = 0;
wiggle = 1;
active = true;
gun_flare = 2;
damage = 1;
spd = 8; 
distance_max = 220; //pixels


image_speed = 1;
angle_prev = 0;
angle_randomize = choose(-7,-3,0,3,7);
mask_index = sArrowInWall;
alarm[0] = 2;

