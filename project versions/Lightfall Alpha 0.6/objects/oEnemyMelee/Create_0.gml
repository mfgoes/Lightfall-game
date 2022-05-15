/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();
target=oPlayer
//general adjustments
walk_spd = 1;
approach_spd = 1.2;
wander_range = 80; //maximum patrol area
reload_spd = 65; 

atk_anim_x = 0 //; //lerp between two points
atk_anim_p = 1; //phase 1 = lunge, phase 2 = go back (add phase 0 = charge) 


out_of_range = false; 
sight_range = 80 + round(random(5)); //when to detect player
atk_range = 5; //closest distance for attacks
damage = 0.1;
hp = 7;

last_faced=-1
atk_check=true
anim_x_length=7
atk_timer=0
dir_atk=0
h=0 // horizontal speed
v=0 // vertical speed
leap_timer=0
leap_goal=100
leap_str=3 // height of the leap
leap_horizontal_str=6 // length of the leap
leap_min_dis=400
h_leap=0
v_leap=0
atk_delay_timer=0
atk_delay_goal=30

grv=0.15


//unique visuals
spriteIdle =	sBoom_walk_cuteeyes;
spriteWalk =	sBoom_walk_cuteeyes;
spriteJump =	sBoom_walk_cuteeyes;
spriteDie  =	sBoom_explode2;
spriteAttack =	sBoomslime_atk;
spriteMelee  =	sBoom_walk_cuteeyes;
mask_index	 =	sBoom_walk_cuteeyes;
//sprite_offset_cleanup();
