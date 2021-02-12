/// @desc 

//gm live 
if (live_call()) return live_result;

motion_speed = 1;
dir_start = 90 //random(360); 
dir = 0; 
out_of_range = false; 
sight_range = 60; //when to detect player
wander_range = 100; 
damage = 1;

//create target on circumference 
targetx = x + lengthdir_x(sight_range,dir);
targety = y + lengthdir_y(sight_range,dir);
xprev = x;
yprev = y;

//state enums for simple enemies
current_state = enemy_states.idle;

//extras
hp = 1;
is_hit = 0; //allows projectiles to hit multiple objects at once
position_random = random_range(-3,3);
recoil = 0; 
patrol_range = 10; //follow distance
image_speed = 1;