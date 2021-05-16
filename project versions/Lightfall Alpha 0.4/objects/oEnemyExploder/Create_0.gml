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

xprev = x;
yprev = y;
walkspd = 1;
hsp = walkspd;

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.patrol;

//extras
hp = 3;
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking