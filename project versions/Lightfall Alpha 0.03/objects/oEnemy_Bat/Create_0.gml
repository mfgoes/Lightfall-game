/// @desc 

//gm live 
if (live_call()) return live_result;

motion_speed = 1;
dir_start = 90 //random(360); 
dir = 0; 
out_of_range = false; 
sight_range = 50; //when to detect player
wander_range = 50; 
damage = 1;

//create target on circumference 
targetx = x + lengthdir_x(sight_range,dir);
targety = y + lengthdir_y(sight_range,dir);
xprev = x;
yprev = y;

//state enums for simple enemies
enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}
current_state = enemy_states.idle;

//extras
hp = 2;
position_random = random_range(-3,3);
recoil = 0; 
patrol_range = 10; //follow distance
