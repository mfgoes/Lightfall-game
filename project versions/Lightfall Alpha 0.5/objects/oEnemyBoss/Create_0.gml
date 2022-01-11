event_inherited();
motion_speed = 1;
dir = 0; 
out_of_range = false; 
sight_range = 220; //when to detect player
atk_range = TILE_SIZE*10; //closest distance for attacks
wander_range = 50; 
damage = 0.1;
reload_spd = 100; 
preferred_range = 100; 

afraid_of_heights = true;
alerted = false; //if player has already been sighted by this unit.
walk_spd = .5;
hsp = walk_spd;
jump_speed = 5;

xprev = x;
yprev = y;
atk_anim_x = 0;
target = oPlayer;

/*enum enemy_states { 
  idle,
  patrol,
  approach,
  attack
}*/
current_state = enemy_states.patrol;

//extras
hp = 10; 
hp_max = hp;
position_random = random_range(-3,3);
stunned = 5; //prevents enemy from walking

image_speed = 0;
image_index = 0;