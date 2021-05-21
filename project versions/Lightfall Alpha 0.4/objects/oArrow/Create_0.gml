/// @description init projectile variables
super_arrow = false;
grv = 0.03; // was 0.02 gravity
vsp = 0;
wiggle = 1;
active = true;
gun_flare = 2;
damage = 2;
image_speed = 1;
angle_prev = 0;
angle_randomize = choose(-7,-3,0,3,7);
mask_index = sArrowInWall;
alarm[0] = 2;