/// @description Insert description here
// You can write your code in this editor
event_inherited();
direction = 270; 
image_angle = direction;
image_speed = 0;
image_index = 1;
spd = 10; vsp = spd; 
damage = choose(0.1,0.05);
gun_flare = 2;
active = false; //activate after travelling X distance

//generate arrow in wall
wiggle = random_range(-15,15);
if random(1) < 0.1 visual = true; else visual = false; 
particles = true;
