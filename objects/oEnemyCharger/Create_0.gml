/// @desc create enemy weapon
event_inherited();
sprite_offset_cleanup();

//unique stats
hp = 5;
sight_range = 120 //randomize later
atk_range = 100; //when to start attack
wander_range = 50; 
damage = 1;
walk_spd = 1;
hsp = 1;
bullrush_dir = 0; 

//unique visuals
spriteIdle =	sBoom_walk_cuteeyes;
spriteWalk =	sBoom_walk_cuteeyes;
spriteJump =	sBoom_walk_cuteeyes;
spriteDie  =	sBoom_explode2;
spriteAttack =	sBoomslime_atk;
spriteMelee  =	sBoom_walk_cuteeyes;
mask_index	 =	sBoom_walk_cuteeyes;
//sprite_offset_cleanup();



// scripts per monster 
idle_behaviour = scr_state_patrol;
approach_behaviour = scr_state_approach;
attack_behaviour = scr_enemy_attack_bullrun;  