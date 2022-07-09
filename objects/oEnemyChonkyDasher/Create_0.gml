/// @desc create enemy weapon
event_inherited();

//unique stats
hp = 5;
sight_range = 120 //randomize later
atk_range = 100; //when to start attack
wander_range = 50; 
damage = 1;
walk_spd = 1;
hsp = 1;
bullrush_dir = 0; 

//animations
spriteIdle =	sEnemyBlob_Idle;
spriteWalk =	sEnemyBlob_Move;
spriteHurt =	sEnemyBlob_Hurt;
spriteDie  =	sEnemyBlob_Die;
spriteAttack  =	sEnemyBlob_Atk;
attack_anim_end = 0; 


// scripts per monster 
// eventually set this per enemy
idle_behaviour = 0;
approach_behaviour = 0;
attack_behaviour = scr_enemy_attack_bullrun(); 