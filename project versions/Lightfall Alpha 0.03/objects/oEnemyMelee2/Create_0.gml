/// @desc create enemy weapon
//if (live_call()) return live_result;

//enemy stats
hp = 3;
damage = 2; //how much damage it can do
walkspd = 1+ random(0.4);
motion_speed = 1;
out_of_range = false; 
sight_range = 80 + round(random_range(5,10)); //when to detect player
atk_range = round(random_range(3,10)); //closest distance for attacks
wander_range = 50; 
current_state = enemy_states.idle;

//extras
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 
dir_start = 90 //random(360); 
dir = 0; 
target = 0;

//animations
spriteIdle =	sEnemyBlob_Idle;
spriteWalk =	sEnemyBlob_Move;
spriteHurt =	sEnemyBlob_Hurt;
spriteDie  =	sEnemyBlob_Die;
spriteAttack  =	sEnemyBlob_Atk;
attack_anim_end = 0; 