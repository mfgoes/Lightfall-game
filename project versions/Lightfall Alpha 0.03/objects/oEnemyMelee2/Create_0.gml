/// @desc create enemy weapon
//if (live_call()) return live_result;

//enemy stats
hp = 2;
damage = 2; //how much damage it can do
walkspd = 0.5;
motion_speed = 1;
out_of_range = false; 
alerted = 0; //if player has already been sighted by this unit.
sight_range = 120; //when to detect player
atk_range = round(random_range(3,10)); //closest distance for attacks
wander_range = 50; 
current_state = enemy_states.idle;

//extras
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 
dir_start = 90 //random(360); 
dir = 0; 

//create target on circumference 
target = 0;
text_pos = choose(20,30,40,50); //debug text

//animations
spriteIdle =	sEnemyBlob_Idle;
spriteWalk =	sEnemyBlob_Move;
spriteHurt =	sEnemyBlob_Hurt;
spriteDie  =	sEnemyBlob_Die;
spriteAttack  =	sEnemyBlob_Atk;
attack_anim_end = 0; 