/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();

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
hp = 40; hp_max = hp; 

//unique visuals
spriteIdle =	sRockBossIdle;
spriteWalk =	sRockBossWalk;
spriteJump =	sRockBossIdle;
spriteDie  =	sRockBossIdle;
spriteAttack =	sRockBossIdle;
spriteMelee  =	sRockBossIdle;
mask_index	 =	spriteIdle;
//sprite_offset_cleanup();
