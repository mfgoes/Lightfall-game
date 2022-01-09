/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();

//general adjustments


walk_spd = 1;
approach_spd = 1.2;
wander_range = 80; //maximum patrol area
reload_spd = 55; 

atk_anim_x = 0 //; //lerp between two points
atk_anim_p = 1; //phase 1 = lunge, phase 2 = go back (add phase 0 = charge) 

out_of_range = false; 
sight_range = 80 + round(random(5)); //when to detect player
atk_range = 5; //closest distance for attacks
damage = 0.1;
hp = 3;

//unique visuals
spriteIdle =	sBoom_walk_cuteeyes;
spriteWalk =	sBoom_walk_cuteeyes;
spriteJump =	sBoom_walk_cuteeyes;
spriteDie  =	sBoom_explode2;
spriteAttack =	sBoomslime_atk;
spriteMelee  =	sBoom_walk_cuteeyes;
mask_index	 =	sBoom_walk_cuteeyes;
sprite_offset_cleanup();
