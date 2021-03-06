/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

//enemy stats
event_inherited();
hp = 2;
motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 120 //randomize later
atk_range = 100; //when to start attack
wander_range = 50; 
damage = 1;
walkspd = 1;
bullrush_dir = 0; 
alerted = 0; //if player has already been sighted by this unit.
//create target on circumference 
target = 0;
text_pos = choose(20,30,40,50); //debug text

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.idle;

//extras
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 

//animations
spriteIdle =	sEnemyBlob_Idle;
spriteWalk =	sEnemyBlob_Move;
spriteHurt =	sEnemyBlob_Hurt;
spriteDie  =	sEnemyBlob_Die;
spriteAttack  =	sEnemyBlob_Atk;
attack_anim_end = 0; 
