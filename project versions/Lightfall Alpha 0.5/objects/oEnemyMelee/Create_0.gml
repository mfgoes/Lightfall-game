/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();

//general adjustments


walkspd = 1;
wander_range = 80; //maximum patrol area
patrol_dir = choose(1,-1); //which direction to walk into

out_of_range = false; 
sight_range = 80 + round(random(5)); //when to detect player
atk_range = 15; //closest distance for attacks
damage = 0.1;
hp = 3;

//unique visuals
spriteIdle =	sEnemyExploder;
spriteWalk =	sEnemyExploder;
spriteJump =	sEnemyExploder;
spriteDie  =	sDummyDie;
spriteAttack  =	sEnemyExploder;
spriteMelee  =	sEnemyExploder;

sprite_offset_cleanup();
