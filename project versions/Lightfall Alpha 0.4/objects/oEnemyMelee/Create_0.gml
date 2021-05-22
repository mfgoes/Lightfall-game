/// @desc create enemy weapon
//gm live 
//if (live_call()) return live_result;

event_inherited();

motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 80 + round(random_range(5,10)); //when to detect player
atk_range = round(random_range(6,10)); //closest distance for attacks
wander_range = 50; 
damage = 1;

//create target on circumference 
target = 0;
targetx = x + lengthdir_x(sight_range,dir);
targety = y + lengthdir_y(sight_range,dir);
xprev = x;
yprev = y;
walkspd = 1+random(0.4);

text_pos = choose(20,30,40,50);

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.idle;

//extras
hp = 1;
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking 

spriteIdle =	sEnemyExploder;
spriteWalk =	sEnemyExploder;
spriteJump =	sEnemyExploder;
spriteDie  =	sDummyDie;
spriteAttack  =	sEnemyExploder;
spriteMelee  =	sEnemyExploder;