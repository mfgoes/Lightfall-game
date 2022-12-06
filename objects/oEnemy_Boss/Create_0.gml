/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();

//boss specific things

ZoomShake(4,30);
//load cutscene here
//move camera to boss briefly


//general adjustments
walk_spd = 1;
approach_spd = 1.2;
wander_range = 80; //maximum patrol area
reload_spd = 100; //reload speed for melee attacks 

atk_anim_x = 0 //; //lerp between two points
atk_anim_p = 1; //phase 1 = lunge, phase 2 = go back (add phase 0 = charge) 

out_of_range = false; 
sight_range = 110 + round(random(5)); //when to detect player
atk_range = 45; //alternate between 5 and 45 (long and short) //closest distance for attacks
damage = 0.5;
atk_type = 1; //shoot stuff. if it's 2, do spike attack. 

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

//create hitbox
hitbox_w = 24;
hitbox_h = 32;


//depth failsafe
if instance_exists(oPlayer) && oPlayer.depth < depth 
	depth = oPlayer.depth+5;
