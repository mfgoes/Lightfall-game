event_inherited();
motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 250; //when to detect player
atk_range = 20; //closest distance for attacks
wander_range = 50; 
damage = 1;
afraid_of_heights = false;
alerted = 0; //if player has already been sighted by this unit.
walkspd = .5;
hsp = walkspd;
jump_spd = 5;

xprev = x;
yprev = y;
walkspd = .5;

target = oPlayer;

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.patrol;

//extras
hp = 5;
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking

image_speed = 0;
image_index = 0;