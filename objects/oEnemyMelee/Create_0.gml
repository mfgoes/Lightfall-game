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



//REPLACE THIS SHITTY SYSTEM WITH STATES. 
//atk_anim_p = 1; //phase 1 = lunge, phase 2 = go back (add phase 0 = charge) 
current_state = enemy_states.approach;
out_of_range = false; 
sight_range = 80 + round(random(5)); //when to detect player
atk_range = 5; //closest distance for attacks
damage = 1;
hp = 7;


//NEW FROM CODER
last_faced=-1
atk_check=true
anim_x_length=7
atk_timer=0
dir_atk=0
h=0 // horizontal speed
v=0 // vertical speed. this is absolutely retarded, 


//new code added by WanSou (05 2022)
leap_timer = 0;
leap_goal = 0; //75;
leap_str = 4; // height of the leap
leap_horizontal_str = 7 // 
leap_ver_str = -4.5 // 
leap_min_dis = 400;
h_leap = 0; h_leap_goal = 0; //goal = speed it wants to be
v_leap = 0;

atk_delay_timer = 0;
atk_delay_goal = 30;
grv=0.15 //this needs to go. use 


//unique visuals
spriteIdle =	sBoom_walk_cuteeyes;
spriteWalk =	sBoom_walk_cuteeyes;
spriteJump =	sBoom_walk_cuteeyes;
spriteDie  =	sBoom_hit;
spriteAttack =	sBoomslime_atk;
spriteMelee  =	sBoom_walk_cuteeyes;
spriteHit	 =  sBoom_hit;	//NEW (OCt 2022)
mask_index	 =	sBoom_walk_cuteeyes;

//sprite_offset_cleanup();
