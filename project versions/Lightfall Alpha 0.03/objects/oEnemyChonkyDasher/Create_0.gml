/// @desc create enemy weapon
//gm live 
if (live_call()) return live_result;

motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 140 //randomize later
atk_range = 120; //when to start attack
wander_range = 50; 
damage = 1;

//create target on circumference 
target = 0;
targetx = x + lengthdir_x(sight_range,dir);
targety = y + lengthdir_y(sight_range,dir);
xprev = x;
yprev = y;
walkspd = 1+random(0.4);
bullrush_dir = 0; 

text_pos = choose(20,30,40,50); //debug text

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.idle;

//extras
hp = 2;
charge_timer = 20; //attack cooldown
target_x = 0; //make this local variable later


position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 


spriteIdle =	sEnemyBlob_Idle;
spriteWalk =	sEnemyBlob_Move;
spriteHurt =	sEnemyBlob_Hurt;
spriteDie  =	sEnemyBlob_Die;
spriteAttack  =	sEnemyBlob_Atk;
attack_anim_end = 0; 