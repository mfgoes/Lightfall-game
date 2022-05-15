/// @desc 

//gm live 
//if (live_call()) return live_result;

event_inherited();

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

idle_timer=0 // timer used to change idle directions
idle_goal=25 //  this is a goal for the timer to determine frequency of changing direction
approach_timer=0 // timer used to know when to update the approach direction
approach_goal=10  // frequency of updating the approach direction
approach_dir=0 // this is used to know which direction to move to approach the player
approach_dir_lerp=0 // used to make the direction change smooth
idle_dir=irandom(359) // which direction to move while idle
idle_dir_lerp=idle_dir // this is used to make the idle_dir smooth so it looks nice

accel=0.25 // acceleration of the movement

dash_decay=0.1 // how fast to slow down from the dash (0 = never // 1 = instant)
knockback_decay=0.2 // same as dash_decay but for knockback

dash_h=0 // horizontal speed of the dash
dash_v=0 // vertical speed of the dash
h = 0 // horizontal speed of movement
v = 0 // vertical speed of movement
knockback_h=0 // horizontal speed of knockback
knockback_v=0 // vertical speed of knockback

atk_timer=0 // timer for the attack
atk_goal=60 // attack frequency

dodge_amt=0 // this counts the amount of times we dodged so we can do some special stuff

atk_delay_timer=0 // timer used to determine when we can damage the player
atk_delay_goal=20 // this is how many frames we can't hit the player for after we hit him once 

//extras
hp = 6;
is_hit = 0; //allows projectiles to hit multiple objects at once
position_random = random_range(-3,3);
recoil = 0; 
patrol_range = 10; //follow distance
image_speed = 1;